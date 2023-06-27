Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3237406E0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 01:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7006C1;
	Wed, 28 Jun 2023 01:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7006C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687909044;
	bh=LW4ffYtAlOGdg70Xi/bJWSA+X43EWRN+IoxuhvnBfI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q6l2MT4vS/ARmu8knEGcP/oUCvUokgpSqNkEFTC6EQIjksJZgdfgcIdJITLTUh7y6
	 2Uw9Rklm+pioNloTQawKWRqi4tJtIepzezpvbg2HAIHKo/mmNnoG6x6SSDmbqh9C8Q
	 yzx1yxQYh8hExPuEGIoDfDuIhxqf53wGQpz21wNY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB9C2F80535; Wed, 28 Jun 2023 01:36:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51FAEF80212;
	Wed, 28 Jun 2023 01:36:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52458F80246; Wed, 28 Jun 2023 01:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F37FFF80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 01:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F37FFF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=lIlERPxv;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=K+Nxy0YO
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 352B13200914;
	Tue, 27 Jun 2023 19:36:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 27 Jun 2023 19:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1687908972; x=
	1687995372; bh=FAAyEM8Ly5PWnExbNv7ubvTfVH0QtKdzbHqCX13GAzg=; b=l
	IlERPxvSpe39YUYHZnaOyWLv1s1k8zsvCBIJF5U+QY9ypB1nulA4rrRQznySXi9F
	qdfWJsAvTgN6t0BvaYOzWOPPbmOWInG6rQvjz488L0nnC2x9zmtU2NQavD4tEi2i
	Rb3uIGfNd9kGO5CtI//igdkti4n8ZIHZbtXi2z0oaQuRIkHYBb5eGoX9HgC/dZ8Y
	QpnY8+I2yTJifPxmw5d/SbUMMaOQmV8lFKvjbsnyVKTFl74QsP5wxBbq62i+Ur/v
	4wAngpX7Nd1j6bGiyNQIR7fij1u6yIwZXEjKvwBrTUgEOLRGwY4UolhxhEVS43Ph
	D2ZEFbnX0IZFnM8mRZlXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687908972; x=1687995372; bh=FAAyEM8Ly5PWn
	ExbNv7ubvTfVH0QtKdzbHqCX13GAzg=; b=K+Nxy0YOe7J0ueBKr1pqqeW2UurQ0
	PN5DErctn5r4iiJoC+crmjrkbSPxmy5Tvi3f1W34dfOqKGhrMFqmxaT0z5FYZKoJ
	lv/yqnPkn2C1KoSnqzTHfMF0LdEeGwdPy5kTZ1lnfe0Fn6iV9WOTKaMzABuYhv5k
	pVWkoHZbzUwpSZVU57bLiqh9lwEMcBBGT9hxGf4HKX/cfRyYOFwi675NjoSh11J/
	0ciYiwS4TO5tlCw4nOhSFm++NK/ITSoDOJ1m7am3/UR0f4bna6Bilp3o9PcWelfz
	R6oY61zRJ4lcg+bdGBU81UZI266qAo71CM5Tm9R5+yc+PD3WSEeQlcc+Q==
X-ME-Sender: <xms:bHKbZFL80QjAugbZ5EXFs64HpbxZ8FWkYBOpHeirjvWJxdrsZI3U3A>
    <xme:bHKbZBI3qGle7beVPqY9-zmFwpnFOEhpKbBRxQqGr-otcPMkxyO6lkVIuoMmAUDJO
    yGHqFFrOB29QKCMYlI>
X-ME-Received: 
 <xmr:bHKbZNv2EXYyk_-3ER_W5GFYTFLqS_PtpA0q5amYEg0yPlMzMyW36S_-_8I447f7j9QolvfzjmElHN1CHp7YF0i30QLByTwUSZs>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtddugddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:bHKbZGZJNiqFsXFwYPdeo91acXo6ieaA_nfP6S_l3gCi5vnkaPMBWw>
    <xmx:bHKbZMaoWhl6zy0G8GQa_1yECBsCFh0-0glVW375saVkrlgCcHQkuQ>
    <xmx:bHKbZKBcqgqSvureY-vlQ4CjXN8FPgb15p7YnissYGbkOl4EhxGR8w>
    <xmx:bHKbZLxd7odaSe15pixMn6AKZDz_pdu-QhKYxrfGavYkQfKLHgw8oA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jun 2023 19:36:09 -0400 (EDT)
Date: Wed, 28 Jun 2023 08:36:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: oxfw: make read-only const array models
 static
Message-ID: <20230627233604.GA278863@workstation.local>
Mail-Followup-To: Colin Ian King <colin.i.king@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20230627113253.700065-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627113253.700065-1-colin.i.king@gmail.com>
Message-ID-Hash: QILGCXRC4BCTH537T43766F5MAIXT3H6
X-Message-ID-Hash: QILGCXRC4BCTH537T43766F5MAIXT3H6
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QILGCXRC4BCTH537T43766F5MAIXT3H6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Jun 27, 2023 at 12:32:53PM +0100, Colin Ian King wrote:
> Don't populate the const array on the stack, instead make it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  sound/firewire/oxfw/oxfw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
> index 9523479fa94a..63d40f1a914f 100644
> --- a/sound/firewire/oxfw/oxfw.c
> +++ b/sound/firewire/oxfw/oxfw.c
> @@ -44,7 +44,7 @@ struct compat_info {
>  
>  static bool detect_loud_models(struct fw_unit *unit)
>  {
> -	const char *const models[] = {
> +	static const char *const models[] = {
>  		"Onyxi",
>  		"Onyx-i",
>  		"Onyx 1640i",
> -- 
> 2.39.2
 
Indeed. It is preferable.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

I found that ALSA fireface driver includes the similar issue. I'll send a
patch to fix it later.


Thanks

Takashi Sakamoto
