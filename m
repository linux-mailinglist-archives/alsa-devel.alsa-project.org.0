Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F15742B25
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 19:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971983E7;
	Thu, 29 Jun 2023 19:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971983E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688059443;
	bh=Hqmll4Dm7TDejuG3L7n3pb2KIS70m4hPt4HDR0LSDKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JZW9DB0AlZUJakO9Np8GJGAmRktZtCQhrRSq0nerGjQMMhcqJDHMgoBhCCnxQKp2b
	 fZvkcFW1cHMBZHUvKuebfhLAkCaJOGbfHlZrBOxrzc55M29uT6vmy7KJs4JWTf03ui
	 yNbLBkyX6hFfCH6Yg8k1eYH7GjC7dobPSddTTJjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C7DCF80246; Thu, 29 Jun 2023 19:23:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A1EF80169;
	Thu, 29 Jun 2023 19:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A139AF80246; Thu, 29 Jun 2023 19:23:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80719F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 19:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80719F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=KmPDis3A;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P60oOGRw
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 42FED320099B;
	Thu, 29 Jun 2023 13:22:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 29 Jun 2023 13:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688059375; x=1688145775; bh=Cw
	E2wcHANU3ek6A8gHn/xl6f0ODbgDTZqECgroPgqbw=; b=KmPDis3AAUdV73TLXo
	3OgDknDtNClg5x81qOb965Qm5cYr8IvBdXhGCvghC6eXv81fiE9fG56quzNDzZst
	/45f3i/zaf2LLN5iCHJQZ/RK3D1QpoqRKUl+8v1fSucJTUF6UJfVar0BDZCQ20Hn
	l+liTEg46Hsd1sng3DdI97pvvFC3kwBWeDW3nwt/uejkcN0J/mk/Y1a8yJDS8bqa
	JMIAxG1Gnlpsr2aM/GkAJzYUPxYnlfZSJ7ZZs6WeYDdcEX6dmVN2SHx0DfUmQX73
	G3/KbHUY0HSz5fHQkbbibFsIsYYtYvP9Y4nJ7mqAHyX83IHBR3X55NcLf7C5gli7
	p6xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688059375; x=1688145775; bh=CwE2wcHANU3ek
	6A8gHn/xl6f0ODbgDTZqECgroPgqbw=; b=P60oOGRwftxmCUZrRzMi4jW32xc8n
	x/eFQb0AcAT1TPGPGifej8BeSyum6UHdShIH8Vel+XbjhTR6dFf6fx7hhL9eYBHC
	8AxQHRCA40a+Q3uWnXXz5wYSAgyTbjqkEjfI8xiy8QVcpXMJy9WWReqY2RA84cCp
	iGz5Lv/Sb8T2zUE0+ISKl2EI4124iK2EICFrWM3mG4XV0hFRnJHrWmi8Ljtg2xhc
	VNaBBAhLyGJZq/4zvRjcmREb60gX9pXeNRgxuGni8h4vTsd/Bfbbkp8fH8aNDhg6
	ubhKsArA6i2l9ey7ciIKEqbX0PU9A/Roz60ygeg9HF4tQ2CLdynNmpM7A==
X-ME-Sender: <xms:7r2dZPDLxq62M1kBStgKsfRuxemXsMrZzXVBnqFElAp05hW8nJmkZA>
    <xme:7r2dZFiRFG8Vyjfyo5GhZZyIwFPE8E0ULnZ1F0bEAKRiKa5s8MlxBpnlzf35RQiKx
    qOf15zr3vC0aA>
X-ME-Received: 
 <xmr:7r2dZKlK1wqTzcXBRUtDDIvakYJooS_zGMyatWd4F6tGlD1OsJtLccEUQulqVE9rJAhJ5BUgmn8kdxg-RZShi0K_UonVJHaFC8H3ww>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:7r2dZBwMbrF4faEtgoZSd7eeg0wEP9Tyhwjf0jLldB286bmYrr_RrA>
    <xmx:7r2dZEQU0Bhnx465BF7A7M9TFiqIYiSbFYJ6-6EjLteV3BCe3mu5oA>
    <xmx:7r2dZEZVZKrU2X_BeAWA3KAVFrEfgS6uSQJJTwTqYP8MvMsHwG9Wvw>
    <xmx:772dZDCeQFPJcEKuRI0bDql2RgH-aTbX7IKfOHr2q36_TPqSiQbNRA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jun 2023 13:22:53 -0400 (EDT)
Date: Thu, 29 Jun 2023 19:22:51 +0200
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
Message-ID: <2023062958-thumping-ambulance-7a2f@gregkh>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
 <2023062940-snore-brick-419b@gregkh>
 <9699a960-74b0-4064-b264-6cde06cd16fc@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9699a960-74b0-4064-b264-6cde06cd16fc@sirena.org.uk>
Message-ID-Hash: OY5S6FGEUJ4EWXUNUI2GF7WAKQNWS52V
X-Message-ID-Hash: OY5S6FGEUJ4EWXUNUI2GF7WAKQNWS52V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OY5S6FGEUJ4EWXUNUI2GF7WAKQNWS52V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 29, 2023 at 05:16:44PM +0100, Mark Brown wrote:
> On Thu, Jun 29, 2023 at 06:06:05PM +0200, Greg KH wrote:
> > On Thu, Jun 29, 2023 at 04:43:57PM +0100, Mark Brown wrote:
> 
> > > Won't this be an ABI change?  That seems like it'd disrupt things in
> > > stable.
> 
> > ABI changes should disrupt things just the same in Linus's tree, why is
> > stable any different?
> 
> This is a numbering resulting from enumeration thing so it gets to be
> like the issues we've had with the order in which block and ethernet
> devices appear, it's on the edge the extent to which people might be
> relying on it.  If it's causing some problem as is and there's a reason
> to do something (see the first half of my reply...) but the case gets
> even harder to make with stable.

It shouldn't matter for stable or not, if the change is acceptable in
Linus's tree, with the userspace visable change, then it should be
acceptable in any active stable branch as well.  There is no difference
here for userspace api/abi rules.

thanks,

greg k-h
