Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212755FB9D9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 19:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5087140E7;
	Tue, 11 Oct 2022 19:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5087140E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665510380;
	bh=KznE0ZWa4Xz193TpMZV/D9nYcpMa7+DL/+lcoUEMsYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJOjGE7HTHxXlkj332I8IDtNwoLzQbJ6bufGJLzBsueCnnwTnK0kVTkoVrHYlsCxW
	 4UKhJQbNmWc56oybDUKYT0hOhSxLexUa8CYApvbGb/Le1u3dr8oWZSuPqB1YoQAywf
	 tp/tvJ5CQ/w4Wgqlbzy4utyiu9Y5hPYVRKpdRvyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD42CF8021D;
	Tue, 11 Oct 2022 19:45:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A0E2F801D5; Tue, 11 Oct 2022 19:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1F18F800C0
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 19:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F18F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jwJ7b5n4"
Received: by mail-vs1-xe2d.google.com with SMTP id l127so15121203vsc.3
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NhUfh06C/An6YGnLWkAPjWZ5V+4TW6TFgUY2N8yedlQ=;
 b=jwJ7b5n4OHJ38hRs//PlrNs39qZE2d2GR4KT/tnJ6P0VN//vN/+KQ5Ptcug1fpGepz
 Q7mhuK9txLhRSb+IhG96/TJBZebtUk1/Oe2igsN6irT4lNzacB/n3vekLgHwJciSv9eI
 ar4EWFfW1X0lUmxB7h/JuUPIE0qoKCzvbFB7V0bsfU/IjEp2c19l3TH6aiPgjsXpdYc7
 HrLeyv8hpdhv3dDMW06WTnSCEiYhFP1wFKG2q2YwbP9MGDdT+jPmCo0A/v9lntj6NWuQ
 GjJJlRsupfg10nF0iGgwFh6T5SIj/UytZeh/vEeuSafWWnLrbI6jlBV7E54pAHXisPwY
 sG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NhUfh06C/An6YGnLWkAPjWZ5V+4TW6TFgUY2N8yedlQ=;
 b=UVJq/zlQBpEs3t1qKzyBd6GOS6hfRt9/Y0w3kGkY+KfE9+OSt68P7oVnNdM/27CFI6
 OlQpDsCqL7y090NJC93VnQgChLnQ8sQWjPE1D00ZFvzHE4EOetpLsfhzxFlEfdRVAL2c
 u26ACe4TzAjriccbbL53X8GNsftk4MWFaoiJSH57xgszba3RJSNfvL83v9dkjIFShwFL
 G+L8IbHT1V9uFvRyEntcJid+HD2OmMXf7vcjauIpscX8RXkdPXcDj1kNnUCu7/jAFcBU
 +bh74FDSjcZ2ljJa7fugAz5lllGtSQHTZB3PB0G/Bdra6msaCV67TtPRXnhWns40hMhH
 uFsQ==
X-Gm-Message-State: ACrzQf3DhxnCZEV93l6cRRzDYP+HWiWhd1TunB+sQEidJK814Vz2Pbje
 +xgkqMOzcoOFUxbasgJ2XU1eGiUUbqtapjYhvMU=
X-Google-Smtp-Source: AMsMyM7iE3eSMLYqCcU4IwkKgRxu0ZhToC4peZYWOaSvN9PvpNYMIpRu5Teh0pjvZr7qcF9IbM7NEt589XVuO419lZ8=
X-Received: by 2002:a05:6102:3172:b0:3a7:319c:ffef with SMTP id
 l18-20020a056102317200b003a7319cffefmr12116685vsm.80.1665510317370; Tue, 11
 Oct 2022 10:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221010092014.2229246-1-xiaolei.wang@windriver.com>
 <20221010145726.GD92394@ediswmail.ad.cirrus.com>
In-Reply-To: <20221010145726.GD92394@ediswmail.ad.cirrus.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 11 Oct 2022 12:45:06 -0500
Message-ID: <CAHCN7xJbwhpL8sp6rn6D5G1PnLJTvaow_b0hF=Lv_AzcWsd4DQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Add an event handler for TEMP_HP and
 TEMP_SPK
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Xiaolei Wang <xiaolei.wang@windriver.com>,
 steve@sk2.org, geert+renesas@glider.be, patches@opensource.cirrus.com,
 tiwai@suse.com, chi.minghao@zte.com.cn, lgirdwood@gmail.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Oct 10, 2022 at 9:57 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Mon, Oct 10, 2022 at 05:20:14PM +0800, Xiaolei Wang wrote:
> > In wm8962 driver, the WM8962_ADDITIONAL_CONTROL_4 is used as a volatile
> > register, but this register mixes a bunch of volatile status bits and a
> > bunch of non-volatile control bits. The dapm widgets TEMP_HP and
> > TEMP_SPK leverages the control bits in this register. After the wm8962
> > probe, the regmap will bet set to cache only mode, then a read error
> > like below would be triggered when trying to read the initial power
> > state of the dapm widgets TEMP_HP and TEMP_SPK.
> >   wm8962 0-001a: ASoC: error at soc_component_read_no_lock
> >   on wm8962.0-001a: -16

Thanks for this.  I saw this same error, but the audio that I use
didn't appear impacted, so I just ignored it.

> >
> > In order to fix this issue, we add event handler to actually power
> > up/down these widgets. With this change, we also need to explicitly
> > power off these widgets in the wm8962 probe since they are enabled
> > by default.
> >
> > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> > ---
>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Tested-by: Adam Ford <aford173@gmail.com>
>
> Thanks,
> Charles
