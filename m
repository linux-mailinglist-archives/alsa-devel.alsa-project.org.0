Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A16F571B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:25:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 663FB135A;
	Wed,  3 May 2023 13:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 663FB135A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113140;
	bh=UegSKa7fiMlBxBXSNX5NnRa5RmZSL7bc0qO9XP3QhzM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hm/rNWmX3cqnXWhxnbKsVnvyFbNetRPjuXVPs14HE1JwdItTlqs/uJFBrx7606lyc
	 SU2q6AYIJSt0CN0UoSQDTRPlQUDahveZYTR+rAeVf7FluqiRUDYoHePHQtlUMnH/Mw
	 mvLe5zRf5RmUch342FT5ist7EoViLDnFY+H47Cas=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD74F8032B;
	Wed,  3 May 2023 13:24:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89D4CF8049E; Wed,  3 May 2023 13:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0871F800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 13:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0871F800EC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CE06423FF1;
	Wed,  3 May 2023 07:24:42 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puAbC-mfv-00; Wed, 03 May 2023 13:24:42 +0200
Date: Wed, 3 May 2023 13:24:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 2/4] pcm: hw: add drain_silence configuration
 keyword
Message-ID: <ZFJEers7NBjf5dCu@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-3-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230502115010.986325-3-perex@perex.cz>
Message-ID-Hash: PSORJUO5LBOR65LA23GVENGPDGTN5SKT
X-Message-ID-Hash: PSORJUO5LBOR65LA23GVENGPDGTN5SKT
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSORJUO5LBOR65LA23GVENGPDGTN5SKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 02, 2023 at 01:50:08PM +0200, Jaroslav Kysela wrote:
>  # Add silence in drain (-1 = auto /default/, 0 = off, > 0 silenced frames)
>  [drain_silence INT]
>
i find this wholly inadequate as a description.
specifically, it's missing a motivation.

and how would one use this in a meaningful way, given that the actual 
silence size is dependent on the period size and preferably the pointer 
alignment?

what i could imagine _hypothetically_ making sense is making the 1/10th 
sec "overshoot" configurable, as it's hardware-dependent. but in 
practice, i don't see how that would be actually useful, as the cost of 
doing too much is negligible, and the default you chose seems more than 
safe enough.

regards
