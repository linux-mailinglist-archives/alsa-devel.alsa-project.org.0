Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237836A3498
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 23:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1FD832;
	Sun, 26 Feb 2023 23:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1FD832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677450180;
	bh=LCyTzTkZJZWVxeaKyfAFTdM/ep+FToZcZyWIkT/h/G0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EWhmIoT0YYWAI9NAOKyUsg0r02+VlcstcksHLfrdFkgrZvBNcJKm22LXFtByJsSP/
	 XQxUU4zpiDTvwXfK0tv9j+Ko1asEnP2AY/PFOyarPUO3SDG0U58AD4gU4JAMCWc9/J
	 Iv5m8U0Dy3wOhvqI1srqcHg3GgFt+KylLWC+t+6A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39744F802BE;
	Sun, 26 Feb 2023 23:22:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1471FF8049C; Sun, 26 Feb 2023 23:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FB3F80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 23:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FB3F80236
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1677450117577629089-webhooks-bot@alsa-project.org>
References: <1677450117577629089-webhooks-bot@alsa-project.org>
Subject: Alsamixer not detecting headphones
Message-Id: <20230226222205.1471FF8049C@alsa1.perex.cz>
Date: Sun, 26 Feb 2023 23:22:05 +0100 (CET)
Message-ID-Hash: X5TWUTLGSNWKM3MX26JKWVTOJORFXL6M
X-Message-ID-Hash: X5TWUTLGSNWKM3MX26JKWVTOJORFXL6M
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5TWUTLGSNWKM3MX26JKWVTOJORFXL6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #283 was edited from lgmventura:

I'm using the motherboard ASUS ROG Strix B760-f Gaming Wifi, which has 7.1 audio channels on the back side and connectors for an audio panel at the front of the case - a microphone and a headphones jack.

When I plug my headphones into the front channels connector (at the back of the PC case) there is normal sound. When I plug it into the headphones jack (at the front of the case), it gets automatically detected by `pavucontrol`, which switches to the headphones as output, as it should be:
![image](https://user-images.githubusercontent.com/16710238/221439991-903fd90b-43b2-41a0-af7f-1ed02085238e.png)

However, there is no sound. When I open `alsamixer` and choose the respective soundcard, which is weirdly called "USB audio" there, I see no volume control for the headphones, as there should be. All it shows is this:
![image](https://user-images.githubusercontent.com/16710238/221440193-381eadfb-fed9-48ad-807b-05c736b65b24.png)

The only way I got to get audio output from the headphones jack is by running `aplay` and choosing the hardware directly from there `aplay -D plughw:1,1 /usr/share/sounds/alsa/Front_Center.wav` or on Audacity by selecting "USB Audio 1: (hw:1,1)" as playback device.

I also tried to use JACK Audio Connection Kit, but found no configuration there that routes the audio to the headphones jack, even trying all 4 possible analogue outputs.

System:
- Motherboard ASUS ROG Strix B760-f Gaming Wifi
- Intel core i7-13700K
- Ubuntu 22.04 (freshly installed)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/283
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
