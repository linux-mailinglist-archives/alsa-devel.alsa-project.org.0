Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C22809E2
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:09:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C57A1AE3;
	Fri,  2 Oct 2020 00:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C57A1AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601590166;
	bh=Qlnff3+RUFU6fp0oIsuxl5hMYTydbSpezEqLLV+f66Y=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WiF2PbSoxJxra6frQBoD4IvLypa94iI9a8qBNf4RcD5w179sy1s32TDN6ZuiBCN8I
	 FwrfTKpcQ9zpg7KUJxOkWJ9U55ZtsOgR/lqrty08klEMc378L0bMHVtvBQYS6EjrLk
	 eTlrdUf0fFDeWjp95Hzut1giItQGwoCF/g5d+aHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BDE3F8020C;
	Fri,  2 Oct 2020 00:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2948FF801F5; Fri,  2 Oct 2020 00:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_139, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B63C1F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B63C1F800AB
Received: from debian.baker-net.org.uk ([212.159.113.184]) by smtp with ESMTP
 id O6jek2j7boEd7O6jfkMtJA; Thu, 01 Oct 2020 23:07:36 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Kp/WJVeN c=1 sm=1 tr=0
 a=fkd5KTHJFGKPA0tsLFcInQ==:117 a=fkd5KTHJFGKPA0tsLFcInQ==:17
 a=IkcTkHD0fZMA:10 a=afefHYAZSVUA:10 a=QstoCHG7tJdJmvnHIKgA:9 a=QEXdDO2ut3YA:10
Received: from [192.168.0.131] (gromit.baker-net.org.uk [192.168.0.131])
 by debian.baker-net.org.uk (Postfix) with ESMTPS id E82CCCD4235;
 Thu,  1 Oct 2020 23:07:33 +0100 (BST)
To: alsa-devel@alsa-project.org
From: Adam Baker <linux@baker-net.org.uk>
Subject: Webcam Microphone not working
Message-ID: <e227d53e-4504-c7d2-dd60-78bc7002bacb@baker-net.org.uk>
Date: Thu, 1 Oct 2020 23:07:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJFW+dFhMszuHdTgep2YFHzp4QZYRSIiPAlR0gAE0VT00QcKWcvkJt0Gj9nDK1enqDgoCJWbBs9oQ/DMiDmOYxD4zXiej1AkKjI3Ar2aUMf9TDCXYGEr
 Q2z98cwlwdUWrxkd0dP7THRReC7AZPDxC1mklyRqNZBL8I3LlS/YKYZxML/4iMPJSnuoXTHo+FniHEZcA1R2vs2F7NhRfqzmXME=
Cc: Takashi Iwai <tiwai@suse.com>
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

I've recently acquired a couple of different cheap webcams and on both
of them the microphone is not working under Linux but works under Windows.

Both cameras appear to use the same chip
ID 1b3f:2002 Generalplus Technology Inc. 808 Camera
which on one endpoint provides a UAC V1 audio signal.

Comparing wireshark USB captures between Windows and Linux I saw that
windows is using much larger URBs than Linux so as a quick hack added to
endpoint.c

+++ sound/usb/endpoint.c	2020-10-01 22:46:30.191648731 +0100
@@ -687,6 +687,10 @@ static int data_ep_set_params(struct snd
 		ep->freqmax = (data_maxsize / (frame_bits >> 3))
 				<< (16 - ep->datainterval);
 	}
+	if (maxsize < 128)
+	       	maxsize = 128;
+	dev_info(&ep->chip->dev->dev, "max: %d, epmax : %d, frq: %d\n",
+		       	maxsize, ep->maxpacksize, ep->freqmax);

 	if (ep->fill_max)
 		ep->curpacksize = ep->maxpacksize;

This was enough to make the microphone work suggesting that I am at
least looking in the right area.

The code in endpoint.c appears to be attempting to optimise the size of
the URB based upon the sample frequency, sample size and the maximum
rate at which packets can be sent in order to minimise latency and allow
accurate start / stop timing. Looking at the packet capture however I
suspect that that calculation is failing to account for some fixed
header sizes.

Before I delve into understanding this code and isochronous USB better
I'd like to know if anyone has quick answers to the following questions:

1) Has this already been addressed in a newer kernel, I'm currently
using Debian 4.19 because that is where I first found the problem?

2) What is the preferred kernel against which patches to this subsystem
should be provided, is it the latest released kernel on Linus' git tree,
the latest RC or a subsystem tree?

3) The sellers of these cameras both claimed they work under Linux. Do I
need to try to find if there was a time in the past when they did work
and if so provide a fixes tag against the commit that broke support?
Would doing so affect the chances of a fixes making it to stable kernels?

4) Is there any documentation other than code comments indicating how
the URB size calculation is supposed to work that I should read?

5) Are there any specific gotchas in this driver that I should be aware of?

Thanks

Adam Baker

P.S. I do realise that once I have a properly tested patch you will want
to see it sent with git-send-email and a signed off by line.
