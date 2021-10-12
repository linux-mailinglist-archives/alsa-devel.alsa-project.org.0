Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26017429E9C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7058168C;
	Tue, 12 Oct 2021 09:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7058168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634023621;
	bh=p7SO9tdPr5qhA3vfrNuL7tNTkkuUHvMgKHhMH/B7feg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIQEA6so7vusaf2jImWQZ9X4ccJw4Be+Q7EtbPzySnku4bNH8GcVcBlV8TdRc7oPt
	 FQimwp8mdPxD0Ab8eeqE25dZpoOpqCCTd+XzSW39DpeFOyynoncGqKDnYdcQeEnyUS
	 nooxpAvFlDiX/Vikt0VWkAqY2yZQHDnZJ/p/fZAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A22F80302;
	Tue, 12 Oct 2021 09:25:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5884CF80212; Tue, 12 Oct 2021 09:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0283F800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0283F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J4zVQsKI"
Received: by mail-wr1-x433.google.com with SMTP id k7so63710251wrd.13
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 00:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=kxug8zb/EGJmL2xGeTXvkDk7vUlZHkHARgIrRXZWVYY=;
 b=J4zVQsKIW0Fn+dUAqKQfD6f1xldVD6mI7fPCF+GfT8rigWHeW3pZfm1uVE+zEIJ/Fl
 kydgpXuDZnam1OfImxkpgpoIAOpM+2qCW4mU1Qhhi3DfWqjEbhFVrIwan+L+sWAdqYxf
 HJKJzZ17edGlKeRgOdvPbcwkhK2XAYK8RhTZgvJsFdhnkn1h2/JfRFj/dcpmwMuYWh/z
 inI4q2lq88tmFDgB0ep6caL711yJBB0rYdtrb5WfD6dV2F6RKhb/Vad+A+k+bgaDf6K8
 yixFzptHDMHadsVnB9FjAjlAsmVoC+zGi65UMklwBgJUfrlqT+OftgbeiTxsxLednWp9
 rfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=kxug8zb/EGJmL2xGeTXvkDk7vUlZHkHARgIrRXZWVYY=;
 b=76yBjef/hP02XOC5epUJ5sIrnx0ibELzMICG1uab6SD5z1fBxKJfC87IX+dOAGJPHf
 b28OeBzuiLqLpqBqyZnbwamAzEC64fpabXY1c3T+pLPqYb4/he9nlf2QKHbuoctNOGbn
 to6Eqs0JkSkbZthEghhsxxCl7WfliH4Mu5lVHjOTbZeBdvqYOJu0Z/U00xQvLFp+5AkP
 5UpMzkYH9qUHbxWzuq0WSLjdfwR0dpvck6xgGsPoWsmdoIYYEiXXBEIXbCh/gwZWv1eo
 pPvik3lBYEGvrlXOnZmFMmmngp97bliksjHaf8LxalYKsbLVj/LLhdTKoIxXM+9JW7Zp
 T5pg==
X-Gm-Message-State: AOAM530mRoPNsVSA0chzLM/Jo/93sAxOWDTW53sIScRYHA9udrUWdV2c
 rkSbLRCi0ygJTcSr0NmRXPQ=
X-Google-Smtp-Source: ABdhPJyWcLdcIK2F1yvYuz94KzMR4N0FArd3m10As4uYLTdeJ+s/yHqkz9aeF94peco5a1PRmNj64Q==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr3798000wmc.86.1634023533805; 
 Tue, 12 Oct 2021 00:25:33 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
 by smtp.gmail.com with ESMTPSA id b2sm1798371wrv.67.2021.10.12.00.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 00:25:33 -0700 (PDT)
Message-ID: <7cd9ccc118c1955b5f3b48f6f8a7157a72d5213e.camel@gmail.com>
Subject: Re: [PATCH v2 6/8] ASoC: cirrus: i2s: Prepare clock before using it
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Mark Brown <broonie@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 12 Oct 2021 09:25:15 +0200
In-Reply-To: <e23f7de1dbb02def413d721a3bf5759100380937.camel@gmail.com>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-7-nikita.shubin@maquefel.me>
 <20210726165124.GJ4670@sirena.org.uk>
 <e23f7de1dbb02def413d721a3bf5759100380937.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
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

Hello Mark,

On Mon, 2021-09-13 at 23:43 +0200, Alexander Sverdlin wrote:
> On Mon, 2021-07-26 at 17:51 +0100, Mark Brown wrote:
> > On Mon, Jul 26, 2021 at 04:59:54PM +0300, Nikita Shubin wrote:
> > > From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > 
> > > Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> > > to Common Clock Framework, otherwise the following is visible:
> > 
> > Acked-by: Mark Brown <broonie@kernel.org>
> 
> would you take the patch to a tree of yours, please?

I still cannot find this patch in any of your trees, but I've found this one:

commit 726e6f31b1026f62206f1d32b5cbb7e9582c4d03
Merge: b09bff2676be 7c72dc56a631
Author: Mark Brown <broonie@kernel.org>
Date:   Tue Aug 3 23:27:27 2021 +0100

    Merge series "arm: ep93xx: CCF conversion" from Nikita Shubin <nikita.shubin@maquefel.me>:
    
    This series series of patches converts ep93xx to Common Clock Framework.
    
    It consists of preparation patches to use clk_prepare_enable where it is
    needed, instead of clk_enable used in ep93xx drivers prior to CCF and
    a patch converting mach-ep93xx/clock.c to CCF.
    
    Link: https://lore.kernel.org/patchwork/cover/1445563/
    Link: https://lore.kernel.org/patchwork/patch/1435884/
    
    v1->v2:
    - added SoB
    
    Alexander Sverdlin (7):
      iio: ep93xx: Prepare clock before using it
      spi: spi-ep93xx: Prepare clock before using it
      Input: ep93xx_keypad: Prepare clock before using it
      video: ep93xx: Prepare clock before using it
      dmaengine: ep93xx: Prepare clock before using it
      ASoC: cirrus: i2s: Prepare clock before using it
      pwm: ep93xx: Prepare clock before using it
    
    Nikita Shubin (1):
      ep93xx: clock: convert in-place to COMMON_CLK


... which claims to merge both "ASoC: cirrus: i2s: Prepare clock before using it"
and "ep93xx: clock: convert in-place to COMMON_CLK", but they are actually not
merged.

Could you please consider ASoC patch, while I will resubmit the final clock conversion?

-- 
Alexander Sverdlin.


