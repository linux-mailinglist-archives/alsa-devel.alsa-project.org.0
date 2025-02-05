Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDAA28795
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2025 11:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58336601D4;
	Wed,  5 Feb 2025 11:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58336601D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738750232;
	bh=wcO0snABHQ/EQlJRhm7GcrcM4rAy14UC6Dnnsk8wbVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZnIuflXndNhdjS2bsxNLWdB2jQpZheqz3gfK3f2vHcOvNYuKK09puDk/QRUBROdHn
	 ITwkG/ELBIDyUoLH2MDzeqhMHPi0gaTxVYOZkQY65+MgSW8/dtQMs3kKvRQt592S0E
	 haEhILourfLudGIB9e+nNRsWOoicixOSQweyEgpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF19FF805BB; Wed,  5 Feb 2025 11:09:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB67F805BB;
	Wed,  5 Feb 2025 11:09:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11EB0F800ED; Wed,  5 Feb 2025 11:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 183A6F800ED
	for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2025 11:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 183A6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UIXaXcP7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A60D85C639A;
	Wed,  5 Feb 2025 10:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C25C4CEE6;
	Wed,  5 Feb 2025 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738750166;
	bh=wcO0snABHQ/EQlJRhm7GcrcM4rAy14UC6Dnnsk8wbVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIXaXcP7VjYb2tahYBouaQIsm+B0Pj3pEpFHpBM5QBAsZBEe14pnRaexLj++442Pf
	 C+wbRjwLmL+m5FMZ6DdkbPL0lPKCac6q1v56Sf7Nm0lmyhQFqyvFTocKDcpTEYFnII
	 07398xW6at2BojjUi9thVCWhZQ06wiZXuRhR6KkhWYJS9eonnLNKseKwZg+yfYmcmF
	 BcrRsLrH4d4NxkMZchWCfmXpv5gDVHsCvFUrmMUKBIti3lHZc4qN2OwS916MoKvT7w
	 othU07/kideZpBID3TIi2Ilh+VWB/tOdvG32QQ2a9D7EHieD4jnjbqGShYqHghS2h5
	 SOXglgoRjlKGw==
Date: Wed, 5 Feb 2025 11:09:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
 Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>, Jeff LaBundy <jeff@labundy.com>,
	Heiko Stuebner <heiko@sntech.de>, Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>, Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND 4/7] dt-bindings: mfd: cirrus,cs40l26: Support for
 CS40L26
Message-ID: <20250205-large-brass-stoat-9c0fe5@krzk-bin>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-5-ftreven@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204231835.2000457-5-ftreven@opensource.cirrus.com>
Message-ID-Hash: DEWWGDU5TGF4WGL554IU6XIXPO53IYOL
X-Message-ID-Hash: DEWWGDU5TGF4WGL554IU6XIXPO53IYOL
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEWWGDU5TGF4WGL554IU6XIXPO53IYOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 04, 2025 at 05:18:33PM -0600, Fred Treven wrote:
> Introduce required basic devicetree parameters for the
> initial commit of CS40L26.
> 
> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
> ---
>  .../bindings/mfd/cirrus,cs40l26.yaml          | 81 +++++++++++++++++++
>  MAINTAINERS                                   |  4 +-

I don't understand why you decided to resend the same two days *AFTER*
you received review.

No, implement the review you already got. Resending the same in such
case is not only unnecessary noise but actually ignores/skips the
review.

NAK

Best regards,
Krzysztof

