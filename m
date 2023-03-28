Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607A6CBE0A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 13:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F9F41EF;
	Tue, 28 Mar 2023 13:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F9F41EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680004116;
	bh=pW8t0YxPj50KnUL43e191QF0Ou6MAE4+jd2c35T/7+4=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XH8l8TRUqyiIkTBbisRu4fmMoGahgDeYWNiT7OWjxQ83mxQ92i2bUTY1Q0OawpQF6
	 p3YoYGNUjv5N1ShPTJObnRfeEz+nrkkuMbv6HBUTNAc2/iyCcRDiiEEPDuT+TBBQNu
	 VqovQUy3SY5GSdmWaY6BFL3ikoMYG7WwJuG8pbjg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0604AF8024E;
	Tue, 28 Mar 2023 13:47:46 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C1E5F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 13:47:37 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: DSD DOP - DAC Support and Viability
From: leonard.bocock@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 28 Mar 2023 11:47:37 -0000
Message-ID: <168000405701.20.1466679246562700959@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: VZBXHZDI3IDSNBFPATO43VOL2244SLAW
X-Message-ID-Hash: VZBXHZDI3IDSNBFPATO43VOL2244SLAW
X-MailFrom: leonard.bocock@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZBXHZDI3IDSNBFPATO43VOL2244SLAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm developing an ALSA based audio application; c and c++. The DSD source file under test is fs64 DSD format. 

It plays well under ALSA using the native DSD frame packer. It plays well using the DSD to PCM decoder and frame packer. 

It is not playing using DOP. 

I'm reasonably confident I have ALSA set up correctly.....
- The ALSA format is set to S32_LE, as supported by the DAC? 
- The ALSA sample rate set in for FS64 which should be 176k?

cat /proc/asound/DX1/pcm0p/sub0/hw_params 

access: RW_INTERLEAVED
format: S32_LE
subformat: STD
channels: 2
rate: 176400 (176400/1)
period_size: 22050
buffer_size: 88200

The 32 bit frames written to snd_pcm_writei() are packed I think as per DOP specification, so the buffer looks like this:

MSB                    LSB
0x5  0xd3  0x2c 0x0 
0x5  0xd3  0x2c  0x0	
0xfa 0xd2  0xd2  0x0
0xfa 0xd2  0xd2  0x0
0x5  0xd2  0xd2  0x0
0x5  0xd2 0xd2  0x0		

There are no overflow or ALSA play errors; however all I get is a high pitched note to start, and then noise. I'm stumped.

The DAC is a Topping DX1 which has an XMOS USB interface and an AK4493S chip. I've also tried my Accuphase DAC-60.

Documentation on this seems sparse.

- How can test if ALSA / Linux is putting the DAC into DOP mode?
- How can I determine if the DAC or USB interface is supported by Debian (latest version) and controlling the DAC correctly?

Is there anything obvious I am missing here?

Thanks,
