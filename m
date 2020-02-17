Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052491608F3
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 04:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 997281682;
	Mon, 17 Feb 2020 04:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 997281682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581910256;
	bh=YJR0j85CBRzr0iRrwH50BrfrW0SrB+wxu7WSlf0UhVA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y2Q0OBdNhxCmkzzCVmkueEugzozGd57isL4sOUHcebbyALC9YV9xvxh5Lg/wD6dki
	 KtZC7l8lioCUXxW3NlU8SiNWkwsr+fo2hES0+uansa4MXWN4Jt8r+G3XqfbBGTiJYz
	 OBFZ2yr/CtquqGfYpW7jMJDLssfrL+bt4p15da7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D79F80214;
	Mon, 17 Feb 2020 04:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D74AF800B6; Mon, 17 Feb 2020 04:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC460F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 04:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC460F800B6
Received: by mail-ed1-f66.google.com with SMTP id p23so18972716edr.5
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=En6qfleyTIxn0Lmliem5wgGqB3laLlmUnkFCgAGehpQ=;
 b=fuig86LnvHk9Wx/Edf3H1Aroc/53Oyr8RpTDSzCNFUVYoEYBjoPaN9eR6HGzEbzYbi
 ijKdIO4YfhzAuZ5L3lMgc/4gjfJwm9o77qf4Sfx5NtzsRs19eeus4nk1IWqP5Kc5f8Uo
 3GsePzwkie1WFkIfDPnW2eGP+4DjqmZdaa0eGLPIeBUK0UaGky6cZnpyBuIMZV2b1eY/
 YQ0PfDflZmAM/6CzENrEIRsqBYZAxR2ExGaWcFpcDn0a7zM6q/HgQcsfwpEyS1cuMXOG
 nagR2OJav8eVJUiVTxgoG/ZNBHLDyH4DzlhZcMK68yCBsUTEa7Szp115ClBbEdtUKX8D
 o9oQ==
X-Gm-Message-State: APjAAAVHFU6T2QMVIqapQmufz6Tc7/DB83seIqlP0ABtrch1M3+d5BPl
 QgNVheg5boRJqJYDLa/MQlxZUwl2eHg=
X-Google-Smtp-Source: APXvYqyC7j8KRBeFBQ8J11A8DSQhRwfxw4tcWnpFLMgtH+kl7Tn+ag7CYv9KVRXM0p0LDvtWpxSRKg==
X-Received: by 2002:a50:875c:: with SMTP id 28mr12680728edv.271.1581910175559; 
 Sun, 16 Feb 2020 19:29:35 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id ks2sm795129ejb.82.2020.02.16.19.29.34
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 19:29:34 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id c84so16835126wme.4
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:29:34 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr19909383wmd.77.1581910174069; 
 Sun, 16 Feb 2020 19:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-3-samuel@sholland.org>
In-Reply-To: <20200217021813.53266-3-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 11:29:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66w5v6MtLzmZ=C_ApNBktTxwgnzprQ8FKmuCbBwhvum9g@mail.gmail.com>
Message-ID: <CAGb2v66w5v6MtLzmZ=C_ApNBktTxwgnzprQ8FKmuCbBwhvum9g@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/8] ASoC: sun50i-codec-analog: Gate the
 amplifier clock during suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 17, 2020 at 10:18 AM Samuel Holland <samuel@sholland.org> wrote:
>
> The clock must be running for the zero-crossing mute functionality.
> However, it must be gated for VDD-SYS to be turned off during system
> suspend. Disable it in the suspend callback, after everything has
> already been muted, to avoid pops when muting/unmuting outputs.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
