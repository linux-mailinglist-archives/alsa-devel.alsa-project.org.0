Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBA27244EC
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 15:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68F7820;
	Tue,  6 Jun 2023 15:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68F7820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686059542;
	bh=qBOg0WBcosAfqnX30wJkJGsyVc54oTgwV+2Lw4IQfY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tx8c08ZSEx3LAAbTlKhZ/v0eR2tdvhknVk0eHU5BJPTVQZgL6OXk+Kavkzt97+77K
	 6cPLUL3Zj783NSrUn9L+sKIik7AOl6LcBr4DmNtfe9xBZHGsHD3rX3aS2nKzNIKR5Z
	 lTTZzGzUNy1Fwl1p2UwJjOXboDrrJ0f3LkD57l3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E783F80527; Tue,  6 Jun 2023 15:51:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B76AF8016C;
	Tue,  6 Jun 2023 15:51:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C079F80199; Tue,  6 Jun 2023 15:51:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 18A6AF800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:50:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 00E4011D5;
	Tue,  6 Jun 2023 15:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 00E4011D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1686059445; bh=inf9czf+Fxft+0nBooxISAuEFReZinVPBtqDt/EIdoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUZRpAjzEIWL/Y6XLYQjIKsPJfvecZuVjnU7H5955AKOjs5pvEu3XBlIEOuxX/PGF
	 05934txPHJYUIfplC71NAXLaHSGjDM7GI3aZIpGGVneL5K4nHYjutVhLlgINMvzLze
	 NeWQq6BD6/njYHApvWVsDPmWICBfN4Ybj2918PO0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  6 Jun 2023 15:50:32 +0200 (CEST)
Message-ID: <d0be2139-0dae-158b-2760-ab62080b73ba@perex.cz>
Date: Tue, 6 Jun 2023 15:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/3] docs: sound: add 'pcmtest' driver documentation
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com, corbet@lwn.net,
 broonie@kernel.org, skhan@linuxfoundation.org
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CRZQE3H2KWF3YMJ2DD4YJXC4OT5UCW7V
X-Message-ID-Hash: CRZQE3H2KWF3YMJ2DD4YJXC4OT5UCW7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRZQE3H2KWF3YMJ2DD4YJXC4OT5UCW7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06. 06. 23 15:38, Ivan Orlov wrote:
> Add documentation for the new Virtual PCM Test Driver. It covers all
> possible usage cases: errors and delay injections, random and
> pattern-based data generation, playback and ioctl redefinition
> functionalities testing.

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

