Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E0870B52D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C0720C;
	Mon, 22 May 2023 08:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C0720C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684737506;
	bh=Bo/IPiyXlfOSaqEHLLOVLILFh5SunUvciEFec8V4U1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eV52xmhicOoC3Pez+j4yLA8uLvbGBUkC2j/t4z1qaODw41ZFJuRlvJyQxsAx8qvSL
	 1VDCkinTaFiWrYVbHvCpqld+/YkQjGECL+8qAJdwhnc92gdgMc4JEZuGQCtHSZR28k
	 LfFfsaBzpYzTFXuMW1KB8qhnnWWSWOJPkB/Vg3gk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 017DAF8016A; Mon, 22 May 2023 08:37:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C73EEF80249;
	Mon, 22 May 2023 08:37:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF6BDF8024E; Mon, 22 May 2023 08:37:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5208F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 08:37:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5DC961E35;
	Mon, 22 May 2023 08:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5DC961E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684737448; bh=Z+wgQr2djj0mYrK6FwnTDhUs1THNxxCuuNK30B12I/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIleVkGw9OEw/Naj0QvRYJ7uV9Cqop3LKJ9ubABf+/5DjeQejKBvBIQ6hQ2V9iTcK
	 9cFukQO/3e0UDRBRJrPeSJBlkCv5rywy6Wa4KYtpq2HVbIEqSOjfggX3KXITNMKGIu
	 h9sTb+/tvVlqlxrP+grrn4fsUg+/LmP33qfzMMRo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 08:37:26 +0200 (CEST)
Message-ID: <b403fdec-0eb8-8830-2310-d584c2114b8a@perex.cz>
Date: Mon, 22 May 2023 08:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/36] ALSA: ump: Additional proc output
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-6-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-6-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DHMJDVDGFRGA6FXWRCQDFW5KDKCMVQ7T
X-Message-ID-Hash: DHMJDVDGFRGA6FXWRCQDFW5KDKCMVQ7T
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHMJDVDGFRGA6FXWRCQDFW5KDKCMVQ7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> UMP devices may have more interesting information than the traditional
> rawmidi.  Extend the rawmidi_global_ops to allow the optional proc
> info output and show some more bits in the proc file for UMP.
> 
> Note that the "Groups" field shows the first and the last UMP Groups,
> and both numbers are 1-based (i.e. the first group is 1).
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

