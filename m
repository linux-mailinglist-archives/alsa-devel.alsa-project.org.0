Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B016A16221
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2025 15:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533F6603D0;
	Sun, 19 Jan 2025 15:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533F6603D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737295429;
	bh=i55omm5iP4fUtUyMk5jZw9ulVCcQxc2BINlnKhSoG1Y=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A0GXruONv0DrNjsZvAzwZmKFIzSdfmtPRxPjpqPbDatS6iknODzDETUxMKTddte4O
	 rT7+X3ReM/neBGhjn43NdYAEr9FlBAQZFMLG4V9j72VYRX01mSmPlgmarZPzf8OmNE
	 n4ICloDdePJH9IrskTaOkAH5dQZrbICokFrqK5j0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28427F805AF; Sun, 19 Jan 2025 15:03:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9764F80557;
	Sun, 19 Jan 2025 15:03:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08C75F804F3; Sun, 19 Jan 2025 15:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19631F80071
	for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2025 15:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19631F80071
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=B/RFp3o1;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=B/RFp3o1
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 6A03B1B2123;
	Sun, 19 Jan 2025 15:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1737295368; bh=i55omm5iP4fUtUyMk5jZw9ulVCcQxc2BINlnKhSoG1Y=;
	h=Date:From:To:Subject:From;
	b=B/RFp3o1osRbAp0O2unLcn3qR0w5H4emf68pHbdetm5L4erUyNQ4WSAWVbWuSJPx9
	 6EuV0UTDSHxs8KjGwlsU1dFWa194BRVpvwfZXMqdS96KhZBlhtgJiLknHK5Iro98ZB
	 KZDqvao8tRz8w+0M4jNAP9ewsgH4ek8uLeuzba8o=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8FgArTRftlx; Sun, 19 Jan 2025 15:02:48 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id E9C071B21C8;
	Sun, 19 Jan 2025 15:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1737295368; bh=i55omm5iP4fUtUyMk5jZw9ulVCcQxc2BINlnKhSoG1Y=;
	h=Date:From:To:Subject:From;
	b=B/RFp3o1osRbAp0O2unLcn3qR0w5H4emf68pHbdetm5L4erUyNQ4WSAWVbWuSJPx9
	 6EuV0UTDSHxs8KjGwlsU1dFWa194BRVpvwfZXMqdS96KhZBlhtgJiLknHK5Iro98ZB
	 KZDqvao8tRz8w+0M4jNAP9ewsgH4ek8uLeuzba8o=
Message-ID: <d3607e2e-51ba-3c62-4232-c035eda98dbb@ivitera.com>
Date: Sun, 19 Jan 2025 15:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Is function delay of the pulse plugin correct?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MP2PAIUXTBNUUSP6RPNVTO3TXKW2ESHK
X-Message-ID-Hash: MP2PAIUXTBNUUSP6RPNVTO3TXKW2ESHK
X-MailFrom: pavel.hofman@ivitera.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MP2PAIUXTBNUUSP6RPNVTO3TXKW2ESHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Please correct me if I am wrong: "avail" means (buffer - buffer_fill),
while "delay" means (buffer_fill + device/downstream delay/latency).
Some drivers/devices do not track the device delay, and then delay =
buffer_fill.

While troubleshooting some playback code, I hit that snd_pcm_delay on
the plugin pulse (device pulse) was always returning 0 frames, while
snd_pcm_avail was returning dynamic (correct) values.

IIUC while pulse_pcm.c uses generic code for avail, it overrides the
generic snd_pcm_ioplug_delay
https://github.com/alsa-project/alsa-lib/blob/35d2efefa95d28e0cd963a06e051f8125823f077/src/pcm/pcm_ioplug.c#L110
with specific pulse_delay
https://github.com/alsa-project/alsa-plugins/blob/52574cb5ccbb8b546df2759e4b341a20332269b6/pulse/pcm_pulse.c#L379
. IIUC this method returns only delay obtained from Pulseaudio, i.e. no
fill of the pulse plugin buffer is included. And IIUC in this specific
case pulseaudio keeps returning zero for the pa_stream_get_latency call,
making snd_pcm_delay return zero too. Therefore the equation (buffer
size = avail + delay - driver/device delay) does not seem to hold for
the pulse plugin.

The new pipewire plugin does not seem to override the generic
snd_pcm_ioplug_delay method
https://github.com/PipeWire/pipewire-alsa/blob/master/alsa-plugins/pcm_pipewire.c#L691-L702
.

Please, is that behavior correct?

With regards,

Pavel.
