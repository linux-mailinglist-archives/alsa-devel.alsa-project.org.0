Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2D185B35
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:34:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACCB186F;
	Sun, 15 Mar 2020 09:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACCB186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261283;
	bh=QmoMrLguuDjA8XpiIfQupTq3izazNikvWt+QEDGgkYU=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DTQ2QYGel8zjLzBfeGQh7E/v/1iSbvYg7g+78GvpSvmjVmKOVzHt/VzhV0am8UXG2
	 gAXe3Ar74dKQNfF8iX99tFptkjKMA91lGSFV9WmtmTKmvceoW+1KhJlHjl0A5ywsc3
	 A/NNAEL1RT8zZJwIqLoybXbvra8Ptw+NOLf6rT7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F487F800CD;
	Sun, 15 Mar 2020 09:33:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B2A5F801D9; Sat, 14 Mar 2020 09:12:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3045F8013D
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 09:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3045F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="G5gbUiEn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From
 :Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8GRYcYJPU9ukGFAGL9EG81YjIIZPeu2Chxb2bcUidHk=; b=G5gbUiEnexZri/Z8lRK/w3Af2e
 M7lPggE2tVhkc2PFKDnKx2DahW7iEvLMGbGTWoyF/y2mivUey2EiieH2thanaaa7zSI9y1OYy9LPd
 dmwr8sF3/C+PEPxH/1J/750QMhy/XtZcTEu4r6YPaiR8AIqPWTwalu8RFYNmqLFROt3I=;
Received: from [fd06:8443:81a1:74b0::212] (port=1222 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jD1t8-0001OH-89; Sat, 14 Mar 2020 09:11:18 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jD1t8-0003cS-2F; Sat, 14 Mar 2020 09:11:18 +0100
Message-ID: <42a9a862efbc9cfdacc783f816f93340ccc58cec.camel@domdv.de>
Subject: [PATCH 0/3] ALSA USB MIDI: Predictable low latency for USB MIDI output
From: Andreas Steinmetz <ast@domdv.de>
To: alsa-devel@alsa-project.org
Date: Sat, 14 Mar 2020 09:11:17 +0100
Organization: D.O.M. Datenverarbeitung GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 15 Mar 2020 09:32:59 +0100
Cc: clemens@ladisch.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The following patch series fixes USB MIDI output starvation and allows
to configure a predictable worst case output latency with a minimum of 15ms
for 16x16 devices and 3.8ms for 4x4 devices (excluding USB transfer time
and latencies of the interface device itself).

The reasoning behind this patch series is first to fix the possible
indefinite latency and then to allow to configure a predictable
low latency to be able to use a cheap embedded Linux system (e.g.
Raspberry Pi) in combination with a multiport USB MIDI interface
as a drop in replacement for commercial hardware based MIDI routing
and filtering products. This includes "real time" (live) usage.

For this usage the guaranteed latency within the kernel must be as
low as possible, depending on the requirements of the USB MIDI
interface in use.

Though the current state of the kernel code is acceptable in a
fully controlled by a single user environment, it is not usable
for uncontrolled standalone use as the driver behaviour then
depends on unpredictable MIDI data streams and thus is unpredictable
in behaviour itself.

After applying this patch series the USB MIDI driver can be used
as usual or it can be tuned to low latency when this is desired.

From a developer perspective the actual output rate of USB MIDI
interfaces is typically slower than the expected 320us and even
varies depending on how many ports are busy (e.g. a M-Audio
Midisport 4x4 AE interface exhibits a varying output rate of
357us to 515us per byte depending on device load). Thus the driver
needs a predictable low latency to allow userspace to use the
rawmidi buffer fill state to estimate the expected output latency
and schedule data accordingly.

The following table shows relative processing time for varying driver
configurations using the M-Audio Midisport 4x4 AE as the test device.
For the parameters "outqueue" and "events" do see the descriptions
of the following patches.

	| unpatched	| outqueue=7	| outqueue=1	| outqueue=1	|
	| kernel	| events=0	| events=0	| events=4	|
--------+---------------+---------------+---------------+---------------+
1 Port	|      100%	|      100%	|      100%	|    100.05%	|
--------+---------------+---------------+---------------+---------------+
4 Ports	|      n/a	|      100%	|     99.97%	|    100.36%	|
--------+---------------+---------------+---------------+---------------+

As can be seen from the above table the changes to output latency do
affect throughput only marginally.


