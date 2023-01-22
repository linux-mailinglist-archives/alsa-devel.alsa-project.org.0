Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AC676C66
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jan 2023 12:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D926441EB;
	Sun, 22 Jan 2023 12:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D926441EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674387707;
	bh=mrCwh8rnHVNuJJ9uXW6L9xtLqHdoTlnPc2chjp+cULc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNKZcsUobyZ2rDXeIhANey7EAHYGmtX0UoQbEQ8bAsdJHF/ti4PdGgYxG2Q5D8HHY
	 98n684E40Mom1qkhEfNAcbGQL9nALAwFLRZ66WlpFLD8oiXOaldex99pcdQJ5yrkSK
	 Ecrrj7MEYOWWX4Te0bRXBDpCdEtbZ5/zzwJMqnkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC4BDF801D5;
	Sun, 22 Jan 2023 12:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 944CFF8027D; Sun, 22 Jan 2023 12:40:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40405F801D5
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 12:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40405F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gnv1AHcd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 44A66B80957;
 Sun, 22 Jan 2023 11:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6930AC433D2;
 Sun, 22 Jan 2023 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674387639;
 bh=mrCwh8rnHVNuJJ9uXW6L9xtLqHdoTlnPc2chjp+cULc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Gnv1AHcdyHkeRaFbaNeLHA3okSsSqgsW3yND4TATCt5+Em0NorUN+xw+4Gsf9cJyW
 Bk03flBM48vOM2FKc7YGWHjySL2DaAY5S+qHfgjpzPUnoGaRoqOrbkfNpZ1yfLoZcx
 HPXjgRxtxILmm3DnpZk6rR9JkbzTWFf5ktgyhuIyXG3WWNz7tlq6Mvy2/kjz8i8xpr
 9ZqZ2da4IIkShSvkUd4nfB7W2yjbeRWcI1gBiYf+JcKYCF1OtSdGcJ2M9VmL6Yu/bA
 s/BW4kiGeJ7tERMkeQPivrw8AmmppBjhNCSYjeSkBDcdO4syo8xt/K0J6WIXdietPI
 taJMDR9AwwuwA==
Message-ID: <e59e3933-1fa2-06c7-9038-3b58822a4a61@kernel.org>
Date: Sun, 22 Jan 2023 12:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: google,sc7280-herobrine: Add
 platform property
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org,
 devicetree@vger.kernel.org, konrad.dybcio@linaro.org
References: <1674210685-19944-1-git-send-email-quic_srivasam@quicinc.com>
 <1674210685-19944-3-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1674210685-19944-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 20/01/2023 11:31, Srinivasa Rao Mandadapu wrote:
> Add platform property in sc7280 machine driver bindings for including
> platform subnode in dai-links.
> This is required for binding the frontend dai driver with codec driver
> and cpu driver and to do dynamic pcm routing in ADSP based platforms.

I have doubts that this is for binding frontend driver with codec and
CPU. The CPU and codec phandles are already there, so they are bound...

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../devicetree/bindings/sound/google,sc7280-herobrine.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> index 869b403..0b1a01a 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> @@ -75,6 +75,18 @@ patternProperties:
>  
>          additionalProperties: false
>  
> +      platform:
> +        description: Holds subnode which includes the phandle of q6apm platform device.
> +        type: object
> +        properties:
> +          sound-dai:
> +            maxItems: 1
> +
> +        required:
> +          - sound-dai
> +
> +        additionalProperties: false
> +
>      required:
>        - link-name
>        - cpu

Add it also to existing example.


Best regards,
Krzysztof

