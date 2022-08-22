Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17459C1B7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 16:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123B616A2;
	Mon, 22 Aug 2022 16:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123B616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661179018;
	bh=84NezB5owjY0HBo2nESIDRVbcvJjVjUGrGNe1bUYREA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqcoczaCa86WK3VwJD1TZCAzYRqxcFbBCe4svnlbKtJmDE/KnKyRS4MJO0dNKnYVT
	 /cDF1lggb10viZ/PIi/r1gH3l0FnddAVdSZHouuUC085/il9LpETFWmgFEhgUVDepG
	 aoExjGRGuy0wXa+qcC1XApRDZN/32MgwkTGwiSfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60ABDF8026D;
	Mon, 22 Aug 2022 16:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36229F8026A; Mon, 22 Aug 2022 16:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 198B5F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 198B5F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ev8pDyCs"
Received: by mail-vs1-xe2a.google.com with SMTP id w188so3286596vsb.10
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=EZm5ORBQuQPCrjLNzB8gAVLdU71FaSkRuBT/lYxiRxM=;
 b=ev8pDyCsAVLoRnkW+qhnhg4pf3v9zdQHOQyCRFxDpZGrMwon9XF/hn+vod9LF5Qil4
 yB5PsB2oCeGGj1HuK+jT7zGyT9b4fdVM41RSl73LnnCuTn3WjHsi1rvEv0JxkgT3JIGi
 KlHibN1mTXdgY+No2r6+KaUezFAp6wcN9LfEynCEw0fA3wu7uP0nrWcShNqrP7HOvueY
 ZwIXORi3HRVX/6wWLjS/1I9/xQ5lx2xrSRqU78M7/j+DGUlNMjnftl2B963BaWGHRDxd
 RxyKCnaZz/yoMJOdhVc+2OHIEINXT5nuskwnenPJMPR7FRUssw+zYDVsFJqQgLFjy5P2
 NcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=EZm5ORBQuQPCrjLNzB8gAVLdU71FaSkRuBT/lYxiRxM=;
 b=e1zY6yXKQRbCu0D6vvCDO+Jk4Q4Iw1FeK8zj1jqosDaI3npB1rUGBxeQtPt9Y/vCXB
 eD9Cbs+uFY52I14cffut9PfPGa5uEB6IZ1BjiuXnlITfbiiN6NvOekeeqUxNRQPASMRx
 EIhGPYAfhoik8vlN5u1Hte2EeArBeAnRhdTjLGGAgTQpyX8H7YQoQgMZ7ElGIrU+VsFF
 qmWtkx0Iw+vhs7FAjxL9CtnCUE/jMUMcN67/KQswXkZcVSLof0ldgMlQWDtwRx3O5jVw
 K4kQJEsC41HaRm8x3FqgHbCFrTRH8TjjCmKcL/KxoqknSWDKsoUVQaS90sOZAIMtoo76
 0Agg==
X-Gm-Message-State: ACgBeo1lOgFrhh423NiEAtWSNut+Ew1105uDIsJKhdeV/MfEBVckAS+T
 5rM4jqSmFtakrRIOnb+EcOI=
X-Google-Smtp-Source: AA6agR5LDq6p3brI5x2xKpN6R88cXnUYUPmt/0O7q3aJU5n+8aT8GmZ29O2Qr2nJdH6p9P4oqTbnKg==
X-Received: by 2002:a05:6102:23f2:b0:38a:8fe2:db89 with SMTP id
 p18-20020a05610223f200b0038a8fe2db89mr6649199vsc.41.1661178949730; 
 Mon, 22 Aug 2022 07:35:49 -0700 (PDT)
Received: from geday ([2804:7f2:8006:f71:a581:5947:7302:d05f])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a056102000500b0038568ec60e7sm8986466vsp.8.2022.08.22.07.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:35:49 -0700 (PDT)
Date: Mon, 22 Aug 2022 11:35:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if hardware
 supports it
Message-ID: <YwOUQoWiPi17zvYD@geday>
References: <YwF+JYR5DxLBnE8F@geday>
 <YwOEPpO0gux+njQe@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwOEPpO0gux+njQe@sirena.org.uk>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Mon, Aug 22, 2022 at 02:27:26PM +0100, Mark Brown wrote:
> On Sat, Aug 20, 2022 at 09:36:53PM -0300, Geraldo Nascimento wrote:
> 
> > +	/*
> > +	 * dw-hdmi introduced insert_pcuv bit in version 2.10a.
> > +	 * When set (1'b1), this bit enables the insertion of the PCUV
> > +	 * (Parity, Channel Status, User bit and Validity) bits on the
> > +	 * incoming audio stream (support limited to Linear PCM audio)
> > +	 */
> > +
> > +	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21)
> > +		conf2 |= HDMI_AUD_CONF2_INSERT_PCUV;
> 
> So what if we're not handlign linear PCM?

Good question, Mark. For HBR and NL-PCM there are different bits that
need to be set in aud_conf2 Sample Register, and then insert_pcuv bit
needs to be dropped.

I don't have a sink handy however to test the other modes. Do you have
a suggestion on how to make this the default for L-PCM specifically?

Thanks,
Geraldo Nascimento
