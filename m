Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420D7DD0B7
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 16:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECA317F1;
	Tue, 31 Oct 2023 16:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECA317F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698766871;
	bh=C6J200hWoYPimUI6ObqpkbWmV/SUs+cMOhTVrFiH/UI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SyxbtUZLZi0a+88nnP48gErpHKnmXH2zkP+h5AzjD/rYjxChHKEmNdkCDmwYs+G63
	 aPzVTvG3jCiP82Dh4mbI7mhJuIphJlLmUks4eRduxlpVtgSq8roSVvheU8xn9zBBlR
	 jnxNqMuHRcoXrO+ze61YQNdnkoMoolPuUrOnll/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66D05F80425; Tue, 31 Oct 2023 16:40:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B372F8016D;
	Tue, 31 Oct 2023 16:40:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A512F8020D; Tue, 31 Oct 2023 16:40:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D76DBF80166
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 16:40:09 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1141611D3;
	Tue, 31 Oct 2023 16:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1141611D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1698766808; bh=BuTBCSjm7r+A45nSMKFtTQ8OKEcAJVngLBjjl54l3Sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q1MEo/YchsqIidCXwn0Y5rYYzoF5mCGuf9vAPFIDZBYzRk+Tes+J1YhcFcIxsM5n/
	 ABt+j2SLkwy7rxmVgwdVD6wq6KbNohwo0vKWk87p6F8Sse+28QAoFZyAw2miZpVT7d
	 r/EzEok9fDXMtL6acbkNzgUjCpoqm+wvM6kOPlo0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 31 Oct 2023 16:40:04 +0100 (CET)
Message-ID: <4d554693-e502-ff10-2478-c61e4632cad5@perex.cz>
Date: Tue, 31 Oct 2023 16:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH alsa-ucm-conf] chtnau8824: Mono speaker fixes
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, alsa-devel@alsa-project.org
References: <20231021143109.52210-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20231021143109.52210-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YCG46A4KVBL3KY4FUJMPT6W3KZPLOVWO
X-Message-ID-Hash: YCG46A4KVBL3KY4FUJMPT6W3KZPLOVWO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCG46A4KVBL3KY4FUJMPT6W3KZPLOVWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 10. 23 16:31, Hans de Goede wrote:
> 2 mono speaker setup fixes:
> 
> 1. Use the kernel's components string to check for a mono-speaker device
> when the board has a components string.
> 
> 2. So far known nau8824 boards with a mono speaker where using the right
> speaker channel, which is unusual. Normally mono speaker setups use
> only the left speaker channel. The Cyberbook T116 tablet is a nau8824
> based model, which indeed uses the left speaker channel for its single
> speaker.
> 
> Modify ucm2/codecs/nau8824/MonoSpeaker.conf to send a left+right
> channel mix to both speaker channels, so that things will work
> independent of which speaker channel is used for a mono setup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks. Applied.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

