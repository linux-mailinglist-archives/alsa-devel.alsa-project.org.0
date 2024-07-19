Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439393718B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 02:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C401E69;
	Fri, 19 Jul 2024 02:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C401E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721349405;
	bh=aqCmlBEExMw+tsMBs0rsU/yV2mnuu8EQ71mkfqJNYms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sMdnW1/lc1X9U0K1fxSQAOw1vW3GnhW1BIol8nEFxsPPOne8YuRF104zPA8wqK4jn
	 HbbNmXz/yjbAn0tTpeP2/KdrWPXK1suV0QLhCphiZ0QAU7rsthWuCLhHEO4Gg8QVlF
	 Qz1ljPSwLYy1FIlWVhvssYuPyEPowwVo5m9ALZe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F191F805AD; Fri, 19 Jul 2024 02:36:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4096F80528;
	Fri, 19 Jul 2024 02:36:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6B1FF804FC; Fri, 19 Jul 2024 02:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D86A2F8007E
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 02:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86A2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=PY/J4x/W;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZnPBsgrF
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0478C11401B8;
	Thu, 18 Jul 2024 20:33:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 18 Jul 2024 20:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1721349225; x=
	1721435625; bh=qY2rXD00orxG414I4HaxdWv3nizC+ShDU8mJqy/ynlo=; b=P
	Y/J4x/W/bxevVXH2cnZTvoLvZH9KtDK4EwDI6jILNkAdkQ1/wjp/FailvazwcNlU
	kBUcfhhCKD/DphavW1XnxmBGG+8TUfpE8vRBC1Uk+dLai8a8jdg1CYQNTF314jie
	HJglcXJ+P8vDTN+AmRhAmcPrHuSQlTe7FoRibRHQDSCXJh790SO1/Ppp+pSrmxz3
	ehzmb54BmJCwdsajCUNpBTQFrctjPigttzVwHwvAZCnoVAM258udbRkAAz86XK3c
	4rToGpPsVOrvOFMGi+1U87p1PS/Bq1UsPkgFRf8XImhLsT4c2w9B9BIrgIdTk9TC
	54EcA1RKQlrABcyCFdiiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721349225; x=1721435625; bh=qY2rXD00orxG414I4HaxdWv3nizC
	+ShDU8mJqy/ynlo=; b=ZnPBsgrFqkqI7RhjeS2/dVXwaT/uvdrzhF93jMnq0JHT
	G0QJgnZR2DP4yiCL2I+gPId7/9tZJn4gpSsZScXWcjn5ECzS7wHYa6A/Unh3dMaV
	x8C+dmm6pA5f9pkEz6Q3NhlWPvr1IrWlW81OyAhbNnhb/+MS0J4u4rSdx/uTRaN/
	bzZwA2Ld1a1li1eqISK7Lo6Gd+V64h5aMW7c6g7F3No678Z9L4/VFIvuBAZk3A+P
	z025dcFnHzgyLTXZxHeaIxkoEPWaZutBGWpC5LEIyuDCaMXjIbU9f6adC7cKxUD0
	aocaPA9E2s6NBttnMGkgYjllV+NBwjvIvaNqEcVfDA==
X-ME-Sender: <xms:aLSZZjKbvbtYVzvvk5gZYqjTRwygisCf-DIqAMG66mpXY56QAjDvTA>
    <xme:aLSZZnIcOP9JUvTqAhZoXKwIfA5OkMRuIJfBurEhKPfZ9XzPNFbp_IlLWsragIZL8
    NAGDdYyaA-iU-UWPQo>
X-ME-Received: 
 <xmr:aLSZZrvg6iB0CcLD6ADKBfX7Drz1DuCbMRc5CZU2XYEbhe5Y6zuvMLJYQYUJ_1l9pSrMm2IvoCoSMF5ENKPSiQOg2BO_s42V9bAh>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrhedtgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:aLSZZsYdMaV4FOFrkzDeZwrbrf1INuWSWtPfa3zhijOAolKMsCWkhQ>
    <xmx:aLSZZqZVddl-3otRJi0-JPle7x_5kiCb50_Eluy6KN7cEEBe5M_-Cg>
    <xmx:aLSZZgA412sKtAt1MElll02AwsvJulubOyliCzBHewy26lvfm3OiMw>
    <xmx:aLSZZoZpkFnA0R8QwPo_wHkBjowF3UfqEKZFzKpZ5ejovvbWLAgThw>
    <xmx:abSZZhVjdwzrd2r5dN6xTIcWEORl8f5OwN0mTOFVXUr9FbRWB5x1V1Te>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jul 2024 20:33:42 -0400 (EDT)
Date: Fri, 19 Jul 2024 09:33:40 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 00/xx] ALSA: ALSA: add snd_stream_is_playback/capture()
Message-ID: <20240719003340.GA381736@workstation.local>
Mail-Followup-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: LN6NVETX4BF5JAO2TQCUQEFJRGHW4D4T
X-Message-ID-Hash: LN6NVETX4BF5JAO2TQCUQEFJRGHW4D4T
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LN6NVETX4BF5JAO2TQCUQEFJRGHW4D4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Thu, Jul 18, 2024 at 11:34:01PM +0000, Kuninori Morimoto wrote:
> Current many drivers are using below code to know its direction.
> 
> 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> 
> I think it should be handled by function. But is it acceptable idea ?
> Because it will be too many patch-set, I want to know it was acceptable
> idea or not before posting patch-bomb.
> 
> I will post main patch, and sample driver patches.

It is better to rename these inline functions introduced in this
patchset so that they belong to PCM category, since in Linux sound
subsystem there is another type of substream in rawmidi category.

The concept of 'substream' corresponds to 'subdevice' in some operations
to PCM/RawMidi cdev, thus should be handled with enough care as much as
possible, in my opinion.


Regards

Takashi Sakamoto
