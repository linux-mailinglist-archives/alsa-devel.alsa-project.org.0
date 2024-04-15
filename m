Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A746D8A4CA7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 12:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE56EC1;
	Mon, 15 Apr 2024 12:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE56EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713177741;
	bh=82Y0G3bT9AqEKJFTZ4ff2iCO6NUje1NWCT51cseTFrM=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TaErvpYDeBlKVhd8Fj7GagwBbuD9KCyiVI0vqQx0LJWQCIq4KqNpLiHg4Z0oRju59
	 VwZ4szXpVHt4ATW6jdkNRICvITNifHC2AVWQ27lHH9c5M058xv+wGNQXRAhmywJM4R
	 sH103L/FXm9SSyRewcLlsUn/+0ZxqxUCbtYcKKlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2EDEF80570; Mon, 15 Apr 2024 12:41:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 383B2F8059F;
	Mon, 15 Apr 2024 12:41:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BE51F8025A; Mon, 15 Apr 2024 12:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2A65F80124
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 12:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A65F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=gDA+9Q/S;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=q0qczvVN
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 3AA5D16A162;
	Mon, 15 Apr 2024 12:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713177698; bh=82Y0G3bT9AqEKJFTZ4ff2iCO6NUje1NWCT51cseTFrM=;
	h=Date:To:From:Subject:From;
	b=gDA+9Q/SbCW5/+2nCdf6sWD6FGsG2EwxuykVoPG8AbvVI37V6TOkX83itncptxKOv
	 9FirBktE9ro3mpDbUjEwT3ZrwyMQESRxIx7PuBMOTi+DCPQk7VnWx+PYX7yPEtXQM5
	 7n8y9MN+UQc39g2vszfA34I5xdLzgYVnBXL7rICA=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rXtn4ru8W1q; Mon, 15 Apr 2024 12:41:37 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id AD77F16B032;
	Mon, 15 Apr 2024 12:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713177697; bh=82Y0G3bT9AqEKJFTZ4ff2iCO6NUje1NWCT51cseTFrM=;
	h=Date:To:From:Subject:From;
	b=q0qczvVNpHQh3y4zVtw4mH3K/R/5ZLEK+b+p3Ba8d/hkoTbXQwuienJmBPey3IayL
	 jU2nhxQJgzrRM8t2P2pLH6YoF8vm/SjLJT5tWFnSB074T5yprIqeXa337q9+NmKyCG
	 C5++rZuCYvdfXTIeHLzaM5Cu/ciP92eKOUFs0AYU=
Message-ID: <272260bd-f185-115a-ce80-ed0560fa891b@ivitera.com>
Date: Mon, 15 Apr 2024 12:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: DSD formats in snd-aloop?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W7PGLUGXRN4XIROQISOD4FWOIMGIGDB5
X-Message-ID-Hash: W7PGLUGXRN4XIROQISOD4FWOIMGIGDB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7PGLUGXRN4XIROQISOD4FWOIMGIGDB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Please would you accept a patch which adds the 16/32bit alsa DSD formats 
to the list of supported audio formats in snd-aloop? The loopback device 
does not modify or access the actual samples in any way, defines no 
volume or mute controls, it's strictly bitperfect.

Thanks a lot for considering,

Pavel.
