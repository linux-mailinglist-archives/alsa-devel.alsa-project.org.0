Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EF12B79FB
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 10:09:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25041674;
	Wed, 18 Nov 2020 10:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25041674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605690548;
	bh=o6QvrESxy9qhh34v17m498xkcTNHiS/81sX1lvzrmT0=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TR06O+NP9BHbQ8qg6om5/byf49zKb1Q3hVHUDKtnOmaYV4Km6BkHicfxpIhDGlCi7
	 HBsGFE18FQYjpQcD2IPSuxwKun/TkBYbjarwWZpA8riUyBs1/WoCaBVYhtZj2kX4dd
	 8s2jsGI0ut2l3SI6NuDzy4VjmZxY4aw7JTXbT/5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B315F8016D;
	Wed, 18 Nov 2020 10:07:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0A03F8016C; Wed, 18 Nov 2020 10:07:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D70C5F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 10:07:20 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 997F6A0040;
 Wed, 18 Nov 2020 10:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 997F6A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1605690437; bh=ITKl31Szh5P3rtdrYUCXc7EXbPgObReLBqsVsGywAQ4=;
 h=To:Cc:From:Subject:Date:From;
 b=zu8COH6Hcfm4UPGRWRy/qbYQN6ec7uTy8C7wZezyBDdBbJXsrhF3sD0Ibxsrxbue7
 fiwaJqkwuS57plDNhnXMCqNCIRtCdQOhGPOL4NbpNhkvK+uOLf4I77BalVbJrcXRS3
 jQn+zS3RseX07cShK2Zn/7PPUquWI2i4D7xHfoUw=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 18 Nov 2020 10:07:15 +0100 (CET)
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: snd-rn-pci-acp3x - auto dmic detection unreliable
Message-ID: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
Date: Wed, 18 Nov 2020 10:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Hi,

	it seems that the ACPI auto-detection of the presence the digital microphone
connected to AMD Renoir audio bridge is unreliable. It may be that hardware
vendors do not provide the correct ACPI tables.
	Could you clarify the usage of _WOV integer value? It seems that this value
is set on those plaforms which do not have the digital microphone (the
microphone is connected to the HDA codec):

Lenovo IdeaPad 5 (15ARE05)
Lenovo Thinkpad X395

	In any case, we should probably improve the auto-detection using DMI or other
platform info.

					Jaroslav

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1892115

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
