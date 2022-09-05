Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149D5AD39C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 15:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8619E1638;
	Mon,  5 Sep 2022 15:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8619E1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662383813;
	bh=08diQpqliOg8PnjD6faTP4D43v7HZENiKV3T8k+jZy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8tg6jYVKF/MnOM6/AraJVyJ1UcbhAXtnXU8dEst+mWBgKqE16odkXKcoqvWo9AuQ
	 5xIe9KMY/3tVhrn8Xb48d4RvNHVqAfJfJaviWd5SJnK8KEt7kN9VnzxOVYTNUwi0hO
	 R3dYEq26IiTjn4ih+V8Q8eaut8hiL4Io6OtyrLiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E6DF8032D;
	Mon,  5 Sep 2022 15:15:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53557F80238; Mon,  5 Sep 2022 15:15:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3901F800CC
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 15:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3901F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F1x+ph1o"
Received: by mail-wr1-x432.google.com with SMTP id n17so11345841wrm.4
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=x+z5fbgK5rWlFLrQ0q/oa0BmwbXh9sKksymdTFC7GMQ=;
 b=F1x+ph1oLUQWORqFZ+6iU5G/jt2WQgwrWWWyebsIQKcW+9UOxdsIIUQypDzGGRcoMi
 j05s3YxGptvw40x7s2JOAozNSdraSyG7GmWotGKU+PpHVJr8IqIsmxfo8jrHiwA3SH2U
 kPhrec/LkEbAmsOxdyGzXrm5disk9kaS4ChhnspXR6U4QEPRGUaqpx7lAXEnA54apaK8
 obP2VMs9Gisccz6V84XLu+YYfLp3yTHNAx8tO1JDXd/vYBqcGQWYbQVji33jodksCizB
 elU37YU0TvQb4NnWJjOV6PWYh7cyuOlx/bHenFczAjoU7wkT9kiJ67sAnF4TNIdW/281
 DsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=x+z5fbgK5rWlFLrQ0q/oa0BmwbXh9sKksymdTFC7GMQ=;
 b=Ilbfit6l1eqQY3cFAy26OPjq57RrEjwz2EftDomXiYi9XYAALCgXN6+vB5QpApUO4m
 WKPhLUoa2mJJbjHGvlMN2jpmxjm/SWo2c8n4AMCo5FxeOg+Io6H4oBWB/QObpdCC7omI
 yj196AAAY4dPh2hE40NffI7CzsbkJ+i9qe4aCOu+KAQVBhPTp7P6vBu2oLiZuO2jjq/p
 XlIV2dgro9/A8zp2gxes6UaphDVICoExu2jxLNwty9U/Db+RFB72PboF4XjMQmuGYJqj
 WYVumipUwWeQsf56vtad2zzEekW84H2kM6A+U2oqiwd0tyD373MqbIaDPxGEUmaAvSCy
 BAzw==
X-Gm-Message-State: ACgBeo3uc/XDwgm6A8K++xzPSMidJWkC7AraDqmpZP9+FrD3MOqujFgZ
 FCifduHTW4CWWdw+E98kl+9SsKrlgE7V0k6KRgg=
X-Google-Smtp-Source: AA6agR4OHk0dWrF3EDRI1FChnBvUyFqcofwqBz5m92F++Rw8GkiS+bAka5b6ma0tgWR/0cMK4A50cXKDzEYmb3n1lV0=
X-Received: by 2002:a5d:6388:0:b0:228:c792:aabe with SMTP id
 p8-20020a5d6388000000b00228c792aabemr1064303wru.689.1662383738519; Mon, 05
 Sep 2022 06:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 5 Sep 2022 06:15:27 -0700
Message-ID: <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Sep 5, 2022 at 3:47 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> @@ -1295,6 +1301,17 @@ static int fsl_asrc_runtime_resume(struct device *dev)
>         regmap_update_bits(asrc->regmap, REG_ASRCTR,
>                            ASRCTR_ASRCEi_ALL_MASK, asrctr);
>
> +       /* Wait for status of initialization for every enabled pairs */
> +       do {
> +               udelay(5);
> +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
> +
> +       /* FIXME: Doesn't treat initialization timeout as error */
> +       if (!retry)
> +               dev_warn(dev, "initialization isn't finished\n");

Any reason why not just dev_err?
