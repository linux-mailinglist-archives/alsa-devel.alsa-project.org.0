Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C75347BFEC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 13:45:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820971FC;
	Tue, 21 Dec 2021 13:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820971FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640090751;
	bh=KN5D64t+ANZpL1fsr9SBeaKr/3ioRCvPPtRDZGOkDA4=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVLuS4l3yeagEwKxndBjEasbdcwN4eAx7dxZUZ43olWasISnwN2o9hfKafyptE5lm
	 ZOve7n34ycjlxbKzG2C56sGK/3qIQrcSounVet9gl8GYYY5k6mW5hpQNjtK1ZjjP0W
	 5sr14fsAp0E5wDTxKjI96S0RahiIrDepB2j9SjHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE171F800B5;
	Tue, 21 Dec 2021 13:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8949F80118; Tue, 21 Dec 2021 13:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF631F800B5
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 13:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF631F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="pf15ho+6"
Received: by mail-wr1-x433.google.com with SMTP id s1so21301056wra.6
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=LFkudhgE/RfVwuGY1n7h7LKuNRIgZvkWEBMWG1M1X6E=;
 b=pf15ho+6XPQgQBH195bxwibSYp3O0VCy8NNQgRII/9a4Nm9b8BuZouEnV4DiiKScLq
 /QiGbT632mF6jEM1flpu3fbwmRRluRrBYvJIbVldwiL7+xjevhYEuTTBBi+MWqNMMNCa
 anAUYQHwNt9C/z5RCLT/eszNX3pxWzVEMTPJ9CpBc3m212mtBnusMem95uW4cK6CB2Gr
 OBXXikXoS4pLauMwcMZmaM76mrmBCOYEKla4TbrOxfSmocBuL+l4t2NOs9vh2uOapvu6
 GVSvVX/0VzlMcUjGmNeSPVyTyiW7ln8CaLvyB37HgfuuEXFNv2P39ozZiQqke9NhLwy/
 VCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=LFkudhgE/RfVwuGY1n7h7LKuNRIgZvkWEBMWG1M1X6E=;
 b=gf4hTMI72I3oxlKCMbT8jurUWo7DRbVxW3HyXaj0Lr1kGnTaUD2THqXIGG1/AxaUX0
 UbfQ23gR8G5GbvT0syd4JDT4TmPGPeH2/UlWU3O44lkRs1OkTi/wXSad78Of9hY6Wecs
 s8oZqSaBNc/ZbIqn1Vm2S55DR1d0WBD2t0W5S+ocTeeC80XoQfRnGJi5dDtCRmX8pR5K
 /Mf94rrg17DJUc0wj+bUNJN/EWKH/gGV/ftdtgS0hGXDKAbz+Idk8MWPDOOQArc4UQ2a
 KPZSrbjqI3fVcoJ/zdUfyJsVjc+Wk9icpyg31BWishhNyBX2Opk+xBRPLZGJDpCV/rV0
 xlSw==
X-Gm-Message-State: AOAM533ZNAAZu9wjLMGGmHviPjTT5qTXY2E2am4Q+pICJGXy/RCZ0oxo
 wp2oguv3nd0b26F4BZh0JWOZijGUYDRp4neS
X-Google-Smtp-Source: ABdhPJy5ufpXEgZoRhzOxuJM0uLIBZI1smTxKJ2/W0UXOvP69/PmKVwEpnZ4JMk3aAEQpmS0N5YbLw==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr2631439wrp.500.1640090668069; 
 Tue, 21 Dec 2021 04:44:28 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v6sm2302654wmh.8.2021.12.21.04.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:44:27 -0800 (PST)
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Use name-prefix schema
Date: Tue, 21 Dec 2021 13:36:03 +0100
In-reply-to: <20211218143423.18768-1-alexander.stein@mailbox.org>
Message-ID: <1jzgou6sba.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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


On Sat 18 Dec 2021 at 15:34, Alexander Stein <alexander.stein@mailbox.org> wrote:

> name-prefix.txt does not exist anymore, just reference the schema instead.
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>

Thanks for doing this.

To keep things coherent, it would be nice if you could do the
same for the other amlogic sound components. They all use prefixes,
except card drivers.

Side note: Any ASoC component could use the sound-name-prefix. Is there
a way express that somehow ? instead of repeating this type of change in
every codec/cpu binding doc ?

> ---
> Changes in v2:
> * Fix 'pass' -> 'true'
>
> .../devicetree/bindings/sound/simple-audio-amplifier.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml b/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
> index 26379377a7ac..8327846356d3 100644
> --- a/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
> @@ -9,6 +9,9 @@ title: Simple Audio Amplifier Device Tree Bindings
>  maintainers:
>    - Jerome Brunet <jbrunet@baylibre.com>
>  
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -22,10 +25,7 @@ properties:
>      description: >
>        power supply for the device
>  
> -  sound-name-prefix:
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description: >
> -      See ./name-prefix.txt
> +  sound-name-prefix: true

I've seen a couple of file with this, according the commit description
it solves some kind of name clash but I did not really get how ...

>  
>  required:
>    - compatible

