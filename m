Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA32A427A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 11:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53E26175C;
	Tue,  3 Nov 2020 11:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53E26175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604399925;
	bh=SSsIl+BXqdZBQA4Hs6N8UkuJ0StkVY5fD7uPaZCc6TE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtV+1pi/J3IKmXX0rpwEIFexffXgHeSZ3oT+vDME9CTSs6PQ5/1d843US1VTGGKEo
	 D/jhZiE1KVTEmd/XEmK8EY/vRVLz6MIQNPb5stCoMn7UbuewHtamkLUVXSTuv77LNY
	 IsmOIXV+CInVriLjEPIJniQLu7BhH0MqI1V/lN+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6C74F80108;
	Tue,  3 Nov 2020 11:37:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2E43F80171; Tue,  3 Nov 2020 11:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B05BF80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 11:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B05BF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Wh6WFkgo"
Received: by mail-lj1-x244.google.com with SMTP id 2so18428277ljj.13
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5GcucvkpK8kMef8JRK6neh/95+aedCMWaWFyvdBMuJI=;
 b=Wh6WFkgoQOQ9/AmfIvmZQkTLiyCit9lXw7J1L5B4rsN7eV0Kg8S23izD3b6C2YQl8f
 4e9CV7RRVNFtXBsy1vVjg1BxjHyYHxLcELHss6N39DRVia9juSjh3foXvWNYiJmja2Gp
 PpEncTfwxF50qMGaUGpvlcRb6M6JB5gOjAYrTFMI/b4ZJw4hcxILn4/foUDQN2diDJXa
 YV3LkJFsLdJJ+Srww0D2FH6CQ8F6Lk0tm62rKAY1y2gcCnmHs3bA2qF2F65n5tQrPa70
 8pkX0SQDLQElFJm8PeAgpSYGx5l2AssKb98QeW/13zat1T8m2b6hpYLI3zCed8XSebe3
 1Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5GcucvkpK8kMef8JRK6neh/95+aedCMWaWFyvdBMuJI=;
 b=NxzvMPPfZWjNgQwnTS5gjn7TVkqC98RzND1B1MeAQ1sSQOQ+llleI6WmN5/sCgoaQ9
 hvma3ZTzQ7lGv4GdyivvaaMhR25kkNyw4c3peqJGrJfo9Lj4TwZhmTnXzqlJkECDlgVF
 tdAlmUevq3zKGHP2nfAsGU8GwDu9aQ5yF4LqRRjx28jNSgEyibxmmdr+y4NLGjzxTRhD
 I4rsRWcu9Iz0dld/0nwd9z9EVvyVuM8IElKyCS2L4PMVKzrgPgHo3++P/VFQ6JWpjQ87
 U9ioxxip9l9AGuadYNVwvgEvURheYp6EUw6D50mf7lXdFRfVtPXFlZw2iWLvJoJxnpIN
 1Nxw==
X-Gm-Message-State: AOAM533aJjaISfDbdqcKYbGGphziJ1qM3WR7ekcuVkCGzSoltblYtj1E
 lI/BpQeBlUlWs/+dQ2WKNfjtHR6RKvCZGdV4+FpXmA==
X-Google-Smtp-Source: ABdhPJyLCXn6n7JwwyyVsJICHg0f8BJ4slro0/8J9XFTybUf/uwbNFZooKlvdhdc49pQBXt8XGZ3L8/0zj1tZuHmsEY=
X-Received: by 2002:a05:651c:291:: with SMTP id
 b17mr7952875ljo.34.1604399826815; 
 Tue, 03 Nov 2020 02:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
 <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 3 Nov 2020 18:36:55 +0800
Message-ID: <CALprXBboAS7Dkn-K5fpKB+XNWShX-1xbgrL4Gzi04uyCwY6ABA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: google: dt-bindings: modify machine bindings
 for two MICs case
To: Ajye Huang <ajye.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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

Hi Rob,
Could you please kindly review this patch ?

 I had got your "reviewed-by" on v1 patch, the v1 depends on this patch series
(https://patchwork.kernel.org/patch/11773221) at that time.

Now, that patch what I depended (11773221) had made modification and
it was Applied to
   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
commit e158d2d83cab ("ASoC: google: dt-bindings: Add sc7180-trogdor
machine bindings")

I noted what I did on cover letter
v2:
- Documentation: Modify the dimc-gpios property description and examples.

That is why I bother you again to review it. Please let me know if
this looks good to you.
Thanks!

On Tue, Nov 3, 2020 at 6:31 PM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> Add a property "dmic-gpios" for switching between two MICs.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index efc34689d6b5..9e0505467e57 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -34,6 +34,9 @@ properties:
>    "#size-cells":
>      const: 0
>
> +  dmic-gpios:
> +    description: GPIO for switching between DMICs
> +
>  patternProperties:
>    "^dai-link(@[0-9])?$":
>      description:
> @@ -81,6 +84,7 @@ additionalProperties: false
>  examples:
>
>    - |
> +    //Example 1
>      sound {
>          compatible = "google,sc7180-trogdor";
>          model = "sc7180-rt5682-max98357a-1mic";
> @@ -128,3 +132,57 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    //Example 2 (2mic case)
> +    sound {
> +        compatible = "google,sc7180-trogdor";
> +        model = "sc7180-rt5682-max98357a-2mic";
> +
> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dmic-gpios = <&tlmm 86 0>;
> +
> +        dai-link@0 {
> +            link-name = "MultiMedia0";
> +            reg = <0>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&alc5682 0>;
> +            };
> +        };
> +
> +        dai-link@1 {
> +            link-name = "MultiMedia1";
> +            reg = <1>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 1>;
> +            };
> +
> +            codec {
> +                sound-dai = <&max98357a>;
> +            };
> +        };
> +
> +        dai-link@2 {
> +            link-name = "MultiMedia2";
> +            reg = <2>;
> +            cpu {
> +                sound-dai = <&lpass_hdmi 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&msm_dp>;
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.25.1
>
