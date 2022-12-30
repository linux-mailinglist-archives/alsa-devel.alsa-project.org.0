Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2F659A9D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 17:35:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E582301;
	Fri, 30 Dec 2022 17:34:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E582301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672418136;
	bh=Bxxere713wqyaIytYSV3HxlQ2DkV3d/hehSkuEOOGgw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qLbKBdDkk+UEnHXEeM7nNwLN3zaoQKOdLYcstDfvt/369Klbpu0btRv2X6R7bEdGr
	 WYCOR8+E8sL1ex/pjwhDM3c31LBhTRs6P1SyV5fhWsxDCaY2VN0I5n6PHyscCaSYnD
	 CeOj19u0Sh5K9yyjVJzEcNqrTGKsBm7m2rgpSdOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2BC5F8042F;
	Fri, 30 Dec 2022 17:34:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63212F804CF; Fri, 30 Dec 2022 17:34:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 999E7F80310
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 17:34:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 999E7F80310
Received: by mail-il1-f178.google.com with SMTP id d10so11516765ilc.12
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 08:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3qCFiFhr0DQPqKmGNLpxSeO70Nn9s9xGFSB4LOgYnXw=;
 b=PqPO0RXXp5aUmWcB+33DddXsYrzN2j/nZSPa50gXIkFcMqV65b46ptfAxwQ4bSMIy6
 4DhI2Av6GQEWaGsET5pf0oWIVBSQo0gokEuibcXhO1GXn1Zr7cCYh2mZEQCafHNwAHvL
 C27E8B+cnub+/TVWr6jxI6SyFW9yvdZ67LnibTDWuA8YdE5xAKIJpa7Vy6LETMphtZyK
 aKW31tdcjMHC0RQi3GqzSh63d5LM739Sw6e77ZwVJuf2c5M2bmlb5IcYP33MozFY6w43
 kh6MA/0vcWOrNL9wxXQpMl0T9pYwB+T9GF0yMtrFPRE/FM6iy5fkHD032LIp0hsNGKMG
 6wng==
X-Gm-Message-State: AFqh2kru1kvSByVLUUtgRiv/CbyxqdCXv1U1+wX4QAyOhUQ834sg0+yy
 VsIvjF1cwKYC4eF3+TdPXA==
X-Google-Smtp-Source: AMrXdXsrunY7o/6mCaL+SQFRgNYEeWlguOTFS+A5Edf7YR0n7hEhWIph7cWjYLAgeDIKK/OhX3Xqnw==
X-Received: by 2002:a05:6e02:f53:b0:30b:f436:930a with SMTP id
 y19-20020a056e020f5300b0030bf436930amr15645641ilj.28.1672418076269; 
 Fri, 30 Dec 2022 08:34:36 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a056638110c00b00389d6a02740sm6731560jal.157.2022.12.30.08.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 08:34:35 -0800 (PST)
Received: (nullmailer pid 1935057 invoked by uid 1000);
 Fri, 30 Dec 2022 16:34:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: wangweidong.a@awinic.com
In-Reply-To: <20221230093454.190579-6-wangweidong.a@awinic.com>
References: <20221230093454.190579-1-wangweidong.a@awinic.com>
 <20221230093454.190579-6-wangweidong.a@awinic.com>
Message-Id: <167241769462.1925797.17416584377760317319.robh@kernel.org>
Subject: Re: [PATCH V8 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Date: Fri, 30 Dec 2022 10:34:28 -0600
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
 zhuning0077@gmail.com, liweilei@awinic.com,
 pierre-louis.bossart@linux.intel.com, povik+lin@cutebit.org,
 flatmax@flatmax.com, devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 stephan@gerhold.net, zhaolei@awinic.com, james.schulman@cirrus.com,
 rf@opensource.cirrus.com, robh+dt@kernel.org, shumingf@realtek.com,
 duanyibo@awinic.com, linux-kernel@vger.kernel.org, yijiangtao@awinic.com,
 broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 30 Dec 2022 17:34:54 +0800, wangweidong.a@awinic.com wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/awinic,aw883xx.example.dts:24.41-42 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/sound/awinic,aw883xx.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221230093454.190579-6-wangweidong.a@awinic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

