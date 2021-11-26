Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8E45E880
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 08:34:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF81B16D0;
	Fri, 26 Nov 2021 08:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF81B16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637912042;
	bh=jZxouEtAEdXNSAu22CTeKbUyWiSnqY6uTM1/cCcWB2A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3aWGsB8S8gYwaeJvetDGoD0Ts09W+fIjMjaNH2wpLbpaeBf71u+48s4C9lTh29yh
	 /+tthTccyYrU67LyBGXrPRNYoPY+poH9A+S6vC8cmgfT/93x7ZjabDIm4m6APZd3ja
	 Ww2wC8Xyna8o5wiCRjRo/lJhXQagXIj+IFegop+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B974F804E6;
	Fri, 26 Nov 2021 08:32:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 188CAF804CF; Fri, 26 Nov 2021 08:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_NONE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37533F80087
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37533F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rUX7EPkO"
Received: by mail-pg1-x531.google.com with SMTP id 137so362206pgg.3
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 23:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/AAtVNxSEEMIS2MWinkvg2Tqw1EN5wSqX+XDPy/nWgI=;
 b=rUX7EPkOpCeOT0XDzv3zPUO65mVufrZATtBDv60kEPRIqIXnd367uOnp27jiHhW1RH
 pfZDsfZurY3opAdcGf9KbD0CAfhLVt2lc23p8w5m5g7ZsI1vPM3dDlMayAl8unNLuaAi
 G7XpZttHEAyra0B8n1oEx1fJSRyN5ROr1twSvleukoCpfjG3iT1ywnNB2G438p+WUIys
 BpRXFIC11cFbUlGHe9PDWmgBInA1QAq8cAUe8RW5pHox17z+ePwRAIRe0iXrndMiPpku
 1llMHJ4ZOUODS2L0ni5PspcTSM8HJ1XdmckmEqkByum9Rjj5mNFqQ6aAS4S/l9AgDrq8
 E8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/AAtVNxSEEMIS2MWinkvg2Tqw1EN5wSqX+XDPy/nWgI=;
 b=gPlLCQ7PhoeMznnWDaLzpQaup6T8B80iMDQ2fiVtWglkLfKtK8hStoo5cMphOANIbD
 +JW/8nu+TtoGP2LoI9vfwMYSht8yPjQFmxJpicnP+5t3ojuQDper5i9tt79DMQcYajU6
 MMaZzZSs1yyuLDo/pUJtntb9yhPmCNdVfc7vW07n4DX4MPT7ZBgcTOeQjuUr+YQQmQez
 KRhG2zPif1Gmm19TNagfy+uMM5XY10cqZzw2xejpdjCTcCzUKWoIuaxvc2VXqK6ecnZA
 4XZEzak4E+VbU3eeh5M/NBJsLcezGSfYFefbvYgN7IAaKMcsXMAqipYoivf+2ufGGhN/
 gB3g==
X-Gm-Message-State: AOAM5311uI1xDMSZieLnXFIKCAAKSB4dOT1Z+3EqjhW4GgVmL0CbuVfB
 QA3tIOE6mqFQUUoe3k7pScu0vA==
X-Google-Smtp-Source: ABdhPJxBCLapsVbR8S32cbgSLGdf670vLzwnMC/H4p+iIY7hAahthtNMoj8b3XEDxeZJspFRP89tZA==
X-Received: by 2002:a65:4b87:: with SMTP id t7mr19646091pgq.115.1637911941740; 
 Thu, 25 Nov 2021 23:32:21 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id d12sm4112656pgf.19.2021.11.25.23.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 23:32:21 -0800 (PST)
Date: Fri, 26 Nov 2021 15:32:17 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v5 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaCNgRHFSoHv4toK@google.com>
References: <20211126071432.21990-1-allen-kh.cheng@mediatek.com>
 <20211126071432.21990-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126071432.21990-4-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Fri, Nov 26, 2021 at 03:14:32PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	return readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0 ? true : false;

The expression "readl(...) == 0" should be already a boolean.
