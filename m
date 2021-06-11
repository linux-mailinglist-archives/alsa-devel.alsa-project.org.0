Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307363A3D92
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 09:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1F518AE;
	Fri, 11 Jun 2021 09:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1F518AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623398031;
	bh=nt6GrByb2r03plsWZ/t3uCTH9lmSFwLtim82LyRHxgk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnIhUH4ouc2rCY57HOgNTmhyv/dsknNgjtH64gH4lbmuH3AvAvM9JHJCFicKcpx4S
	 EsQJyLVM6Yd+2VJhWsDnM6oLsPDXZpf5s2EAE98I0D3shcThqs8vxOpZmttIHnO0lI
	 qjkws/SHPhekItDJii9i8PPc5nFPVfgsw078K5DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C59DF80276;
	Fri, 11 Jun 2021 09:52:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45351F8026C; Fri, 11 Jun 2021 09:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BAECF800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 09:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BAECF800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="m7g+vJ7P"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15B7oitW094138;
 Fri, 11 Jun 2021 07:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=e55MhkD6kqQ3ahhtoTKfb1XuZ404XtogjGwwIDI7/Kg=;
 b=m7g+vJ7PsSSN5aCCEuQL1mem8pC0AlWM2wkfEdf1ZMrM36ZBXQ4Z0kUpIgIcgGxixwJk
 t7uLq9PgATzlBdEQdO1HFq6B8s0wY7AhZSuL2Gy+uk5b6p34VP6eoPBJFep4qxH1g3sB
 rC6KpIuy2rvD70NcuIxtk37fEKoB7hk3UeLoGsZ3YhE0A67ez7WguvVVzmGv3OqoTx5Y
 pn5Q3RHkxGu7U6K4lNKhdK5m+L3T8oA7meSp1s1jnZb64tbEdPjblwfCQAqjJ4KT1dK4
 6GjBeq+cokCWQmdtKUiZOW38bZ6pvqgMvCTJQshpH5+O8YHC9CYYp0pcUoCRmFsK36F5 sQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 3914quvfc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 07:52:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15B7p4rj149485;
 Fri, 11 Jun 2021 07:52:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38yyad8fuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 07:52:05 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15B7p6kk149643;
 Fri, 11 Jun 2021 07:52:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 38yyad8fus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 07:52:04 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15B7pxV4026069;
 Fri, 11 Jun 2021 07:52:03 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Jun 2021 07:51:59 +0000
Date: Fri, 11 Jun 2021 10:51:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: adg: clearly handle clock error / NULL case
Message-ID: <20210611075151.GC10983@kadam>
References: <87zgvxs3rj.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgvxs3rj.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: KDqegDQj-u3dqHGuzQHR4WN6sYXfNQIu
X-Proofpoint-GUID: KDqegDQj-u3dqHGuzQHR4WN6sYXfNQIu
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10011
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110050
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Fri, Jun 11, 2021 at 08:23:28AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This driver is assuming that all adg->clk[i] is not NULL.
> Because of this prerequisites, for_each_rsnd_clk() is possible to work
> for all clk without checking NULL. In other words, all adg->clk[i]
> should not NULL.
> 
> Some SoC might doesn't have clk_a/b/c/i. devm_clk_get() returns error in
> such case. This driver calls rsnd_adg_null_clk_get() and use null_clk
> instead of NULL in such cases.
> 
> But devm_clk_get() might returns NULL even though such clocks exist, but
> it doesn't mean error (user deliberately chose to disable the feature).
> NULL clk itself is not error from clk point of view, but is error from
> this driver point of view because it is not assuming such case.
> 
> But current code is using IS_ERR() which doesn't care NULL.
> This driver uses IS_ERR_OR_NULL() instead of IS_ERR() for clk check.
> And it uses ERR_CAST() to clarify null_clk error.
> 
> One concern here is that it unconditionally uses null_clk if clk_a/b/c/i
> was error. It is correct if it doesn't exist, but is not correct if it
> returns error even though it exist.
> It needs to check "clock-names" from DT before calling devm_clk_get() to
> handling such case. But let's assume it is overkill so far.
> 
> Link: https://lore.kernel.org/r/YMCmhfQUimHCSH/n@mwanda 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sh/rcar/adg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
> index 0ebee1ed06a9..abe9d539709b 100644
> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -393,7 +393,7 @@ static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
>  	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
>  	if (IS_ERR(clk)) {
>  		dev_err(dev, "create null clk error\n");
> -		return NULL;
> +		return ERR_CAST(clk);
>  	}
>  
>  	return clk;
> @@ -430,9 +430,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
>  	for (i = 0; i < CLKMAX; i++) {
>  		clk = devm_clk_get(dev, clk_name[i]);
>  
> -		if (IS_ERR(clk))
> +		if (IS_ERR_OR_NULL(clk))
>  			clk = rsnd_adg_null_clk_get(priv);
> -		if (IS_ERR(clk))
> +		if (IS_ERR_OR_NULL(clk))

"clk" can't be NULL here, right?  So this should just be:

	if (IS_ERR(clk))

(because when a function returns NULL it shouldn't print an error)

regards,
dan carpenter
