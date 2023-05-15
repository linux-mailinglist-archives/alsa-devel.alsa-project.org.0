Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1D7029AE
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 11:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8848E820;
	Mon, 15 May 2023 11:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8848E820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684144600;
	bh=LxFmNkRqlQKlyhTzr5MCX/sjhNFaXUy27ziuS3Klwcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PS1masHSyd9/bRI265NYTAhdt5dYS+dSM92U8owLd7j1k3Ca8J7yMh3Xouo0AW4ve
	 cI40WiD8mvYUkwkmRfbxYHSvVZ+QOgST7XsSR2aEijSKuRWf46ptNt2kgP+4SoNTAM
	 TZSxYb43zHsJVBVf8TOr2e6AbcoR5VRclpMREM9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A99DF80542; Mon, 15 May 2023 11:55:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B81F8025A;
	Mon, 15 May 2023 11:55:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A998AF80272; Mon, 15 May 2023 11:55:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4749BF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 11:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4749BF8016D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 14B2324060;
	Mon, 15 May 2023 05:55:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyUvA-UOL-00; Mon, 15 May 2023 11:55:12 +0200
Date: Mon, 15 May 2023 11:55:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/2] pcm: hw: reinterpret the drain_silence setting
Message-ID: <ZGIBgAN5v/fwwSDB@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230515084106.3447657-1-oswald.buddenhagen@gmx.de>
 <dfe607f4-2cee-be2d-561f-1674e156edc0@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <dfe607f4-2cee-be2d-561f-1674e156edc0@perex.cz>
Message-ID-Hash: ZGQF53TP3ATWTZWQW2BMWFDQQ5Y6E5MR
X-Message-ID-Hash: ZGQF53TP3ATWTZWQW2BMWFDQQ5Y6E5MR
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGQF53TP3ATWTZWQW2BMWFDQQ5Y6E5MR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 15, 2023 at 11:06:54AM +0200, Jaroslav Kysela wrote:
>On 15. 05. 23 10:41, Oswald Buddenhagen wrote:
>> It makes no sense to have a config option which determines the entire
>> silencing time, because useful values strongly depend on the period size
>> runtime setting.
>
>I would prefer a drain silence mode configuration field for this, if the 
>interpretation of the positive value is different. The current value is easy 
>to understand and it's really a corner case to not use the default (auto) 
>code.
>
but why would you *want* that? what would one use it for? what is the 
advantage over my proposal?
i don't think "easier to understand" is true. it may seem easier on the 
surface, but one cannot make an informed decision without actually 
understanding the implications.

>Even the period time may be forced in the configuration, so users can 
>compute the right value themselves.
>
that means that only by combining the two options you'd actually get 
something that makes sense.
my proposal otoh works both with and without a forced period time.

regards
