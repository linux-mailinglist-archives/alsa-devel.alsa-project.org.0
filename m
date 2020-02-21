Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF9168096
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 15:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C1C16BE;
	Fri, 21 Feb 2020 15:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C1C16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582296288;
	bh=EH07Sa74416rTFrpSSX370sMT98bhk2djbVpHjIuIZY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJ/EsPVzXAAiyWF8LJeAlCTgBr0N6nFzUt+AMXK6xVK8w3CUDUVEm2oJ10gqYMPUw
	 WgseTJB41SJh65ho5abcMaqQvG7xIAqPO53dalA3DE6A8lLJEhGLBCTGXTAux8fp60
	 snr5Hbs6toeRym4ADjXKeAa0a8HjM8kk7oBfncVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C01F80273;
	Fri, 21 Feb 2020 15:43:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 145C3F8025F; Fri, 21 Feb 2020 15:43:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0183.hostedemail.com
 [216.40.44.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBCE4F80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 15:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCE4F80114
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 815CD18224949;
 Fri, 21 Feb 2020 14:42:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: side25_19d6a506e5525
X-Filterd-Recvd-Size: 1548
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Fri, 21 Feb 2020 14:42:57 +0000 (UTC)
Message-ID: <1247da797bc0a860e845989241385e124e589063.camel@perches.com>
Subject: Re: [PATCH] Intel: Skylake: Fix inconsistent IS_ERR and PTR_ERR
From: Joe Perches <joe@perches.com>
To: Xu Wang <vulab@iscas.ac.cn>, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org
Date: Fri, 21 Feb 2020 06:41:32 -0800
In-Reply-To: <20200221101112.3104-1-vulab@iscas.ac.cn>
References: <20200221101112.3104-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org
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

On Fri, 2020-02-21 at 18:11 +0800, Xu Wang wrote:
> PTR_ERR should access the value just tested by IS_ERR.
> In skl_clk_dev_probe(),it is inconsistent.
[]
> diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
[]
> @@ -384,7 +384,7 @@ static int skl_clk_dev_probe(struct platform_device *pdev)
>  				&clks[i], clk_pdata, i);
>  
>  		if (IS_ERR(data->clk[data->avail_clk_cnt])) {
> -			ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
> +			ret = PTR_ERR(data->clk[data->avail_clk_cnt]);

NAK.

This is not inconsistent and you are removing the ++
which is a post increment.  Likely that is necessary.

You could write the access and the increment as two
separate statements if it confuses you.


