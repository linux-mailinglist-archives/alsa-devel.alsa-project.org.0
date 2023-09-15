Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543287A1BD7
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 12:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6484C93A;
	Fri, 15 Sep 2023 12:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6484C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694772877;
	bh=M16xMKwqzf4GH8CWZwTtkEHbEEkHOXLNiN1wAg3ecCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rEpLCrZi3xiaAgOJeHvJopt8RW7oU2IYyfmr0KvuwDrg4vXD1s+UHSc7VXYge8Wn+
	 HBEfwFxnmztzh80tXvfngGIgHGv4M2ZrPvZYVEuJz3GiM2RS030AAnBdt/R57WXOdk
	 U2C3/AyU95mHewB+rC30JGjv/1+CLU1GGRaZe8Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4689F801F5; Fri, 15 Sep 2023 12:13:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB04F80246;
	Fri, 15 Sep 2023 12:13:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B22F80425; Fri, 15 Sep 2023 12:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2754FF8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 12:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2754FF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=nZ+R1ltt;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LBbQ7vkQ
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id A4B373200906;
	Fri, 15 Sep 2023 06:13:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 15 Sep 2023 06:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694772810; x=
	1694859210; bh=sxk3KYuf316CdgamtNeKka9P8XUVr/Zj4ZO+uj4B7qU=; b=n
	Z+R1lttzCC58sB4rVwps6+CRlLoSJ90JXM/mtlikHPE8MJfQiYV2SUl0p3USHCjx
	NeuovaK4jSrEYDyWoNeAWrQOquPseeK/oPsGw2eg/tlUuIaEAHA9zweFXd2u1BWC
	7oiT//FqFEWhdgQMcn8vHmB+sx4DPA44c+gN92LKgcyMbG50fvzDbgbAHvP2eZvf
	sowmEF21G/b31SSr98pWTB9vtOmsLX0P7LyF07iFkV93qxFeGE5inCmvARQYTSgZ
	B1RxDMpCEIHPV+3o7egv7oLoT0RlHspm5BTs4QkasuSEbGn093uaEjv/07n5xUWL
	72sFBkJuCRqh9irNkmC1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694772810; x=1694859210; bh=sxk3KYuf316Cd
	gamtNeKka9P8XUVr/Zj4ZO+uj4B7qU=; b=LBbQ7vkQrNaiW63T6faX5bydlZNrp
	MIWQyoog444PB91jxFqAaRoDf6S8+7CtpgUxNg3aBM5Atp6qczCtGaiMbSPeDbfJ
	oHRskXzst3zWduKiXKlreUy2Wn4hP6/S/0ror1wUVDZ226GQTiiZ5kWO9zZE+edA
	lNZRmKcrPxS9TVSNsqm/W//bkTN4CbAJnFQxkPPAgEzF3FEkPvwvRF7h1fO7SiLZ
	SiE4hp4NJ2/JVS0ihmHKe6s2sIaLnXXXz2Hl7CPOg2M4pgFd5Q18dp5HoMc/zneJ
	/0yOekDj0xF59IT1MbLBXL/vr+vCHDdwfAW0ohPlMe+7xvyK1BqoV19/Q==
X-ME-Sender: <xms:SS4EZewYrsGsZXUGSFFSPoGUDCDJh5EZ2aga8jxOTlZeJkuGLrha6w>
    <xme:SS4EZaTACss_r2Wqo7OGIgCyT-u34WdhvVT9EdU2OK_pbCbpXK2cgRzb5R2KGl4Gh
    VdxnSp348A5sDsOfzY>
X-ME-Received: 
 <xmr:SS4EZQW2N-Ps1P8xPvap9Zi6Ns-fBSZXHcgLsq1aUEmPeMXEbTqvuGvvgWxi6aEk87mR8UXNop5BcSQNvs9X1iwFV8mUGNv6Og>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudejvddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:SS4EZUhqwDMFM47DQxYeSUy3jD-duxSojy2_Jlim0DN-hDj7yby2bg>
    <xmx:SS4EZQC1DY9dTtQAQkjsbZ3DU-Ab5fiyn1miZr8NXKtmQn88eM0UaQ>
    <xmx:SS4EZVKtWpadCoF9Ven5ssAKlVER3hieyhMCRb4dF_2eBoDAJnDEhw>
    <xmx:Si4EZbquQXZYUntp0VyAAUJQqEWpwIG3IRNB8v4dcy5JqXtNMFhmYA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 06:13:28 -0400 (EDT)
Date: Fri, 15 Sep 2023 19:13:26 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 10/13] ALSA: firewire: Fix -Wformat-truncation warning
 for longname string
Message-ID: <20230915101326.GA157572@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230915082802.28684-1-tiwai@suse.de>
 <20230915082802.28684-11-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915082802.28684-11-tiwai@suse.de>
Message-ID-Hash: VLHK55BTHJWRKMYZCBMX5LBLJQM3RGAE
X-Message-ID-Hash: VLHK55BTHJWRKMYZCBMX5LBLJQM3RGAE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLHK55BTHJWRKMYZCBMX5LBLJQM3RGAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Fri, Sep 15, 2023 at 10:27:59AM +0200, Takashi Iwai wrote:
> The filling of card->longname can be gracefully truncated, as it's
> only informative.  Use scnprintf() and suppress the superfluous
> compile warning with -Wformat-truncation.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/fireworks/fireworks.c | 10 +++++-----
>  sound/firewire/oxfw/oxfw.c           | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
> index dd4298876ac0..e3ed4e094ccd 100644
> --- a/sound/firewire/fireworks/fireworks.c
> +++ b/sound/firewire/fireworks/fireworks.c
> @@ -93,11 +93,11 @@ get_hardware_info(struct snd_efw *efw)
>  	strcpy(efw->card->driver, "Fireworks");
>  	strcpy(efw->card->shortname, hwinfo->model_name);
>  	strcpy(efw->card->mixername, hwinfo->model_name);
> -	snprintf(efw->card->longname, sizeof(efw->card->longname),
> -		 "%s %s v%s, GUID %08x%08x at %s, S%d",
> -		 hwinfo->vendor_name, hwinfo->model_name, version,
> -		 hwinfo->guid_hi, hwinfo->guid_lo,
> -		 dev_name(&efw->unit->device), 100 << fw_dev->max_speed);
> +	scnprintf(efw->card->longname, sizeof(efw->card->longname),
> +		  "%s %s v%s, GUID %08x%08x at %s, S%d",
> +		  hwinfo->vendor_name, hwinfo->model_name, version,
> +		  hwinfo->guid_hi, hwinfo->guid_lo,
> +		  dev_name(&efw->unit->device), 100 << fw_dev->max_speed);
>  
>  	if (hwinfo->flags & BIT(FLAG_RESP_ADDR_CHANGABLE))
>  		efw->resp_addr_changable = true;
> diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
> index 63d40f1a914f..241a697ce26b 100644
> --- a/sound/firewire/oxfw/oxfw.c
> +++ b/sound/firewire/oxfw/oxfw.c
> @@ -108,11 +108,11 @@ static int name_card(struct snd_oxfw *oxfw, const struct ieee1394_device_id *ent
>  	strcpy(oxfw->card->mixername, m);
>  	strcpy(oxfw->card->shortname, m);
>  
> -	snprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
> -		 "%s %s (OXFW%x %04x), GUID %08x%08x at %s, S%d",
> -		 v, m, firmware >> 20, firmware & 0xffff,
> -		 fw_dev->config_rom[3], fw_dev->config_rom[4],
> -		 dev_name(&oxfw->unit->device), 100 << fw_dev->max_speed);
> +	scnprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
> +		  "%s %s (OXFW%x %04x), GUID %08x%08x at %s, S%d",
> +		  v, m, firmware >> 20, firmware & 0xffff,
> +		  fw_dev->config_rom[3], fw_dev->config_rom[4],
> +		  dev_name(&oxfw->unit->device), 100 << fw_dev->max_speed);
>  end:
>  	return err;
>  }
> -- 
> 2.35.3

Thanks

Takashi Sakamoto
