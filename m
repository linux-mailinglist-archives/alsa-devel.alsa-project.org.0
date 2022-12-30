Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1A6597EE
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 13:01:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FB8189D;
	Fri, 30 Dec 2022 13:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FB8189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672401701;
	bh=s3IpmZaI1oNr3hbXUtoMo+kn1eNU8Zuel72RvAO/YQc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EmN9ORus0bxesJ2Dg0+PDmgpXZrq18HAcmMPaz1ugOHJbkAAlIgPbLyolP7aLkhNC
	 hQMJXyFqESlpvO0sZ15tl07pJ+3/5tfAYrZda6OIOdgtmRogz1i0HMWoD8lvmmsiO5
	 Dhxa3UNKXJdZDmnT+4bLylcyfndgOrlWfVEgzEeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4280F804CF;
	Fri, 30 Dec 2022 13:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD88DF804B4; Fri, 30 Dec 2022 13:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F25F80424
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 13:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F25F80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=dbV1dOEJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672401630;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=9Z6rhz3xhVtCnOws5cJg8Yt7TrbTu3QnfEu/OT2wWIU=;
 b=dbV1dOEJ9YmY2tyq4gkAwd5Sox5nTsyoMAHJvFzLqaM3wogQ1qF0zUWZh6DAPlgJjQ
 9KyBEsmvz3dgLoDqC9bl3UvvA7cpiJ5GhzpxVNAlpTgi6RAAejZPEcxfDpLf9VM0o67k
 pluoLrO3p4Z9EJngTQb63+gasWG+YkuFbEcrb6e8SwHlJIFCjEAJGDNR80fFG391daJ4
 YnPip5jQZndXRELwq6+mm21/gnjv9gx5nXvbCLPB27jg9euh35xAuuNQJ7FMIfdepUhw
 vRhTBIRq7RFqtd0nnqizZkb5MZ1jOAPBxEpRbJmU/S/L8vuR6A6n10MODDxbFy0t6rTQ
 Mguw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJAhdlWwfOntQ=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id Yce349yBUC0PYxI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 30 Dec 2022 13:00:25 +0100 (CET)
Date: Fri, 30 Dec 2022 13:00:19 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: wangweidong.a@awinic.com
Subject: Re: [PATCH V8 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Message-ID: <Y67S07ghnNTuJcWg@gerhold.net>
References: <20221230093454.190579-1-wangweidong.a@awinic.com>
 <20221230093454.190579-6-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230093454.190579-6-wangweidong.a@awinic.com>
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
Cc: alsa-devel@alsa-project.org, steve@sk2.org, tanureal@opensource.cirrus.com,
 lgirdwood@gmail.com, cezary.rojewski@intel.com, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 zhuning0077@gmail.com, pierre-louis.bossart@linux.intel.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, devicetree@vger.kernel.org,
 ckeepax@opensource.cirrus.com, duanyibo@awinic.com, zhaolei@awinic.com,
 james.schulman@cirrus.com, rf@opensource.cirrus.com, robh+dt@kernel.org,
 shumingf@realtek.com, liweilei@awinic.com, linux-kernel@vger.kernel.org,
 yijiangtao@awinic.com, broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 30, 2022 at 05:34:54PM +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..b677427ebcd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW883xx Smart Audio Amplifier
> +
> +maintainers:
> +  - Stephan Weidong Wang <wangweidong.a@awinic.com>

Is my first name still meant to be here?
You should probably drop the "Stephan" :)

Thanks,
Stephan
