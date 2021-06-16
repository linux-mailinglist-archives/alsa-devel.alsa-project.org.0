Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A953A93B8
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 09:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488411688;
	Wed, 16 Jun 2021 09:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488411688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623828314;
	bh=hCRHtYAQi7c86r0AZXLMvQKohpmJ8G7412Hu6hR74rM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ElsirxFD3wA7hAZlTkTDtgljthOtQRt6Twhg+TZQufc5FI904ph1lkbGqwoi/KjL/
	 1ZH2W38T6dHnOIfxoHpRBYRIz/MXb3NzYxThBUCA+ugoatlfLv8GYX6MTFCd87XEtH
	 cg8qFRAWYuDZ81Diz7LQNMZ2f+SlMI7SUsUUFOLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B35E0F80424;
	Wed, 16 Jun 2021 09:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23B0FF80423; Wed, 16 Jun 2021 09:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C187F8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 09:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C187F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="PLbjy+pI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="E5M8/x41"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 30A7C58045F;
 Wed, 16 Jun 2021 03:23:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 16 Jun 2021 03:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=0
 Bpx4KO8jDptlgGldj5m9Ic3pEd6Z1ap4w1RDEKuOU4=; b=PLbjy+pIkr6Bdmdrt
 CFsSt3vAEL3C6Tg0vdQP1ATgChB7/CKYpdnBO/Fb+EfPzFTEk9DNst9rK9ydr/nO
 eHp2+mfn8qkQ7H1uZUjF+yAwiz2MHH12uqU7EQsqIOFVR4iep9J63kM8rTr5yTTK
 8DdjobZuqWQ9S6Dxw/pPbyOFYhKmoqsfwrkgEKI21UQ6WS+4j7ZEiyAfeRuxgGVm
 vrQjW+DUK0MqtIizZoutS+psxU2HzYXEy7N8wVMyCMNlNdtJT0/bgnsbAhYVmHFa
 IzVFivQs0bY8BWjLfJybMJoTsy5/YPARkXYNBn68GmnOagGB84AXTZepGh93WSzm
 UK4yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=0Bpx4KO8jDptlgGldj5m9Ic3pEd6Z1ap4w1RDEKuO
 U4=; b=E5M8/x41Rw/OyVn/JZ+BAR45JbhmclF3yQfZgmqHZXJEQiPu86yfo4YD+
 IlzGI49EzABWf/0zpueWQY3U/qxm1CQOj9tO008cDgN6dNhtgAtVQ2s535qk9jlS
 g7IhwfRHIfSWjbmEQCew1JVvrLur8HcDzubJBL7wU8NPZBtwhp8pjVS6WjSt7nNz
 pM8qPjpEOHL/Xcy8kelR8PG2/z4hC4jadg1Mm/AjkFFW1GUZQyAdGDkMA4Q1Ec7d
 0N9peJAs2M/VgpG/PPVypc/GOhbWSJMcZT59F/rb6iASE/VyfTf0niFzwO+YGq1t
 vJXiyOu2/BYrtInmUGZBm9RIhwtjA==
X-ME-Sender: <xms:9qbJYMp_RlBXasf8s3VrI837sJik8goo6HbLrM18jzk7G6mwGPMMbA>
 <xme:9qbJYCoBAsfOrOtXKnzzlfL0xEeUaAPhrnj_U_qaI3KfPmhDdB2JW6FtmE4Vixcy-
 DBUrPWMHKys5Z16Qh8>
X-ME-Received: <xmr:9qbJYBOT_v4rL0PN8R2LmaTUymwDT2erI-hfguQzKvYzQsyXpnK0oRkBOouTJCuEFw6We0CCSCDtkxPI08hOP62_FEIQ0jg5qk39>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvkedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepkeeileetveejffegueetjeeigffgfefgkeeuueetfffhheegveefhfek
 heevkedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:9qbJYD4d755efuScEGvo5aEHGclrJkxPP3l5twqayvhb05GHa57TkQ>
 <xmx:9qbJYL7rgHUG5opgvclOVf5pSVw71ZlgwL2DpTx-j8CA9C_dYtMuYQ>
 <xmx:9qbJYDiwv3ObAf5VYlmQ3H1UBsPO-Ga4FfBtFk_L4NKd281rWPPRBw>
 <xmx:-KbJYIEJHtaXsWfZZ-ZTJNKaiByAfZOQF3wBAMtIBilPDN3XubK_4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 03:23:34 -0400 (EDT)
Date: Wed, 16 Jun 2021 09:23:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [GIT PULL] HDMI codec improvements, v2
Message-ID: <20210616072331.l6z6sywlfyrg3x2z@gilmour>
References: <20210610122550.jnriewchqspdcrwk@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210610122550.jnriewchqspdcrwk@gilmour>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Thomas,

On Thu, Jun 10, 2021 at 02:25:50PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here's a PR for the changes to hdmi-codec that need to be shared between
> drm-misc-next and ASoC.
>=20
> This is the second iteration, fixing a bisection issue with compilation
>=20
> Thanks!
> Maxime
>=20
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627=
b5:
>=20
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/as=
oc-hdmi-codec-improvements-v2
>=20
> for you to fetch changes up to 2fef64eec23a0840c97977b16dd8919afaffa876:
>=20
>   ASoC: hdmi-codec: Add a prepare hook (2021-06-10 11:48:56 +0200)
>=20
> ----------------------------------------------------------------
> Improvements to the hdmi-codec driver and ALSA infrastructure around it
> to support the HDMI Channel Mapping and IEC958 controls

This has been merged into the ASoC tree [1], can you merge it in drm-misc-n=
ext?

Thanks!
Maxime

1: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit=
/?id=3D116b1e12b72f308b28af5b17081fdb9e1942a8ea
