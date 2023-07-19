Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF475A131
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 00:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928D11F3;
	Thu, 20 Jul 2023 00:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928D11F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689804068;
	bh=NPZ2zlHWpq/Wbwqq/LXMY0mNMpyY8P8jMZ/UIlCWaBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rjMZYiWeiP3hbbabwWIRtDG5UuQio0sabJVobyobKzHXAT6yjx5O1KAfPIPaJ832C
	 J3u1jvjvsufki43i+fLR11GXzicQXy0bNloXGxoIS9UxfiPV1ESPopvRoXjcUuyoH3
	 OhxVwYuzZSN7n7hJatSZn2VTBxxgAnjKHqpFalGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F7F0F80527; Thu, 20 Jul 2023 00:00:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECCDCF8047D;
	Thu, 20 Jul 2023 00:00:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBBFAF8047D; Thu, 20 Jul 2023 00:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68CBFF800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 23:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68CBFF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hnbRgyQv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF68261841;
	Wed, 19 Jul 2023 21:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EA0C433C7;
	Wed, 19 Jul 2023 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689803990;
	bh=NPZ2zlHWpq/Wbwqq/LXMY0mNMpyY8P8jMZ/UIlCWaBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnbRgyQvvOD7UpR2u3pvvqqbol+MasDVHdU0XsqNc3+0Qb/MIdj9BEGM7TxWoTGIo
	 ElZ1aeXMyOyt9TIPPYRz3wpQ+do+Kjm3fKcveIg4dQQDBvM5HG94c124SnW6RiEdMJ
	 i5PFCzZzZfK0GFZXciY19QQ33ettBE1lnfkCdtV3k5Iltpd2EsynwfgRKX/0f6gcsq
	 KoQ2B40lgCQB3zmnIcUY5uK1YEauYTdTh2mWS64acJ+L5cTbX4hiVlf4JBJGIE2PJk
	 IojtKyszvXujEso9Q8A0T5cpKqfyJaeqlranZ6vVpSMy+Kp4PsRbDRgqxWXq8K8QgO
	 eOvL7uDXqZJwA==
Received: (nullmailer pid 852428 invoked by uid 1000);
	Wed, 19 Jul 2023 21:59:47 -0000
Date: Wed, 19 Jul 2023 15:59:47 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org,
 Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
 Andy Gross <agross@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: dt-bindings: pm8916-analog-codec: Fix
 misleading example
Message-ID: <168980398687.852368.16225201877767633294.robh@kernel.org>
References: <20230718-pm8916-mclk-v1-0-4b4a58b4240a@gerhold.net>
 <20230718-pm8916-mclk-v1-1-4b4a58b4240a@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718-pm8916-mclk-v1-1-4b4a58b4240a@gerhold.net>
Message-ID-Hash: EQEAPL6IS75BR5FHP5YBCOGBI3RXTUMW
X-Message-ID-Hash: EQEAPL6IS75BR5FHP5YBCOGBI3RXTUMW
X-MailFrom: SRS0=QU89=DF=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQEAPL6IS75BR5FHP5YBCOGBI3RXTUMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 18 Jul 2023 13:40:13 +0200, Stephan Gerhold wrote:
> SPMI devices typically have a single address cell and no size cell,
> i.e. reg = <0xf000> for the audio codec instead of reg = <0xf000 0x200>.
> 
> The example is a bit misleading because it uses the latter. Copying
> this into the device tree would be incorrect and was fixed before for
> pm8916.dtsi in commit c2f0cbb57dba ("arm64: dts: qcom: pm8916: Remove
> invalid reg size from wcd_codec").
> 
> Make the example more clear by adding the outer "pmic" node which
> specifies the same #address/size-cells that would be used in the
> real deivce tree.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 92 ++++++++++++----------
>  1 file changed, 50 insertions(+), 42 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

