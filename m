Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706C70B636
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E014084B;
	Mon, 22 May 2023 09:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E014084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684739771;
	bh=nPOvzq8ewxOoMeZPuJh/4hzztLzWurpbNa00rq5NTc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PbjOZEnkerAYQTx8wrVziK38q6NXJ+1M7pV6I25D9JRRxESkpfWojwArTjTdZh0Qw
	 fGkcrJmjo5FUsCNgFDkj077nw9SeyQxcuh0vWaR6qEIiHM69DpvnW2WuQA4AluP4pu
	 OSS9FNqRmt6qQ7g9dwEJRiYsg1mKc7T1VjehbXgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C9EFF80544; Mon, 22 May 2023 09:15:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F416F80542;
	Mon, 22 May 2023 09:15:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 500CFF80544; Mon, 22 May 2023 09:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 626CDF8026A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:15:15 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 497401E35;
	Mon, 22 May 2023 09:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 497401E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684739714; bh=BP63rawrK96+23Tv6gw7EB7lt/E/pls7fKZkEz3iKzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cbGe4hgvQRLp/avPfF+lvptfHPvL7lSEaWvyJf+qm8fXDEl3mMTGaD2t+0Fc0RO2w
	 8Eua8nrudv1yNyHn7TvfREqsO6rSzLmOLcX/7lvSS1DkUAreVfotWR3ukPDZxn7MrO
	 LNb+uCVE2kdkN1SDRJFI0agYinmQfK8zcZ7yu3d8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:15:12 +0200 (CEST)
Message-ID: <a3bc2ba0-f2c1-a458-ca0c-3f15caf0c053@perex.cz>
Date: Mon, 22 May 2023 09:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 22/36] ALSA: seq: Prohibit creating ports with special
 numbers
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-23-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-23-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MA7T52DMYLYZUHHGT7EOK2MLVJG5QX6Y
X-Message-ID-Hash: MA7T52DMYLYZUHHGT7EOK2MLVJG5QX6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MA7T52DMYLYZUHHGT7EOK2MLVJG5QX6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Some port numbers are special, such as 254 for subscribers and 255 for
> broadcast.  Return error if application tries to create such a port.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

