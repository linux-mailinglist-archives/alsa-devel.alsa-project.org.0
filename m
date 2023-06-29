Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A07742A41
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 18:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C3420C;
	Thu, 29 Jun 2023 18:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C3420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688054836;
	bh=JD41GP5yjircsAMbzfzr8/mQVBWCM+mUSozgQC7B6HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oHZ+O9Bt72NQxnRY5BMKuaBGu0GXzhTDWF+TOhKiIk4ADUBHde/G6Zwy8xx5Tcrm4
	 fTvCp5d8stxMqerMXUUuE4nq9RAIsUFlN2r3M9JaCtyTK+uTTjz3bRbQpmGMhMVPQ+
	 ImVu/h1tNrYCg/k+Los5r3sX7+dOrauFzKLWqnyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90083F80544; Thu, 29 Jun 2023 18:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C42EF80212;
	Thu, 29 Jun 2023 18:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A92B5F80246; Thu, 29 Jun 2023 18:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46104F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 18:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46104F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=zKcmx+Ao;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=K9MmruBb
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id C3FFE320090C;
	Thu, 29 Jun 2023 12:06:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 12:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688054770; x=1688141170; bh=aQ
	l6t/V3Yr9WqaPI64E3eafGxIBMivgTwolzo540MwQ=; b=zKcmx+AoZpC4z76nNs
	jG6GaVixiTyXGVMnxIuLTSn/nwq6i9nM26CQiWIxSO4z+x8Ufz+nDhBUGEKu2QBz
	0Zvn3iaXQ7jlN4ny0U7uDxRcei5Cn8r4pA20t2eWjLmNN6cZoBbC5Ew3x69u5ClB
	ZrthhvRp1nwk8MpQZccABzjxXkNlDg7b5rBQwf1sXViaj1QaHAwZQ/zhOOYCmFY1
	0N2hcom3ZgCJo4W0aCUQY/N1LiqmXjoHS59CZAGKTVQlngYNnOpDEF+I3j85mIhN
	4WXz5g3ZJ6hQ+Pw8yXbuTLXak7Ww2cSSJp6WTQLOm54nrElIG/RgV8kQgjmlZXc1
	tklA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688054770; x=1688141170; bh=aQl6t/V3Yr9Wq
	aPI64E3eafGxIBMivgTwolzo540MwQ=; b=K9MmruBbgYjYAAi0g6IMntUQNx8fY
	4Cwicx2o37fK2cckgB985dbDs1ZVgtNuMUOwUf7s//f8EIjcYBHRDF/tSS8yiOnf
	Y62GyL3RNl2OZe7Waim285CpdqSVlyrdWqRrPokz6useu6bkXipKKrnXV6G80+oY
	7Lg1s3W1HIawaHhVq2A4doj9KwaJM/jdbh0dmPTaNn/kZrPbS6OTqAnuzEotT20/
	x+CzekSbobd2YnggL3qOFC0DfAXqzuI+CQNelQIsbkX+ZkgoCIAjuuxe3WSzhzrJ
	XqFlCEKCbDrdnARzLPMtb9qLFE5uXsl6eB5UGSITMGcsNSpcHK9MH51HQ==
X-ME-Sender: <xms:8KudZMedTBkWyxppC0_grAdJxIkMaNOyhaVN6z_BqqJ80s6J7zwHkw>
    <xme:8KudZOMTyuiKyTRA6ZUsZ2Y2Pwg6uhiqEDRdEJCQZRgh2w9gQ-5DkW_WE2reKYGZW
    RNvTU0KxDTBdw>
X-ME-Received: 
 <xmr:8KudZNjBjNJFS-kQ-10MuiVDarsV3C2Q0Q7CsWML-ZM41bWONYMmk6rowi-ddqTTmtII_3pl4ycTffKA0vg17o7BtsAtk7TTPVSwQg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:8KudZB8FGmQ-ZnMNAuePDpb2Ipsp0yOHMigWww0-vhnhLyzWrPFa9A>
    <xmx:8KudZIvMhdZ3qvXqt2-F3miAvHhwal9jLP_BYX_C10mcIcw368mJdw>
    <xmx:8KudZIGVxyePNZCrbdRR_zP-pX02xCQRrNWG3_MzORZSXAd49mFZ9g>
    <xmx:8qudZIcnH18b3PjwV_8t_Iu4LRAbbysytcgLtbtHAFW4eQMjZq7ahQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jun 2023 12:06:07 -0400 (EDT)
Date: Thu, 29 Jun 2023 18:06:05 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <2023062940-snore-brick-419b@gregkh>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
Message-ID-Hash: OISNHV5EBKOVA6I3FCQQWC2Q6M3AKLEU
X-Message-ID-Hash: OISNHV5EBKOVA6I3FCQQWC2Q6M3AKLEU
X-MailFrom: greg@kroah.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OISNHV5EBKOVA6I3FCQQWC2Q6M3AKLEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 29, 2023 at 04:43:57PM +0100, Mark Brown wrote:
> On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:
> > For some reason we ended up with a setup without this flag.
> > This resulted in inconsistent sound card devices numbers which
> >  are also not starting as expected at dai_link->id.
> >  (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)
> 
> Why is this a problem?
> 
> > With this patch patch now the MultiMedia1 PCM ends up with device number 0
> > as expected.
> > 
> > Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> > Cc: <Stable@vger.kernel.org>
> 
> Won't this be an ABI change?  That seems like it'd disrupt things in
> stable.

ABI changes should disrupt things just the same in Linus's tree, why is
stable any different?

thanks,

greg k-h

