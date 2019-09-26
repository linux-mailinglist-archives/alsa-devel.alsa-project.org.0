Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CDBF393
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:57:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B3C81746;
	Thu, 26 Sep 2019 14:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B3C81746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569502676;
	bh=EoUwdKrFxhnLewIjrKzkWtoKj46IqP9p8DUh5TxFfdA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbjmgP3feT+LX1JsEBaeubypBP3T6Ig0sV3OQ08rJZDiHxmIjkV0Rz9mlljlBnwDN
	 1Cf3Fn+o1/W+Z/sT56PocDCQfk0NAALQnxqEAleD15nwG9UQVWA6bfZZodT2rKBUQC
	 Vg8lYEigoiUk1pd4FEgOBocw4g1YLU497eO9smow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12DB4F8048D;
	Thu, 26 Sep 2019 14:56:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA13BF803F4; Thu, 26 Sep 2019 14:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83244F80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83244F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="N6BslChf"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8QChmox126209;
 Thu, 26 Sep 2019 12:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=wgbB1gckrWIlucivgg+XWAxQa+UFNwnWecELwTVQsJU=;
 b=N6BslChfal8kgvrGAJzkingykcTMlYd1NcnZtth2N9VL1pVIsYFPTg8RxUNyS8GkypHp
 RIyEmIxN54gm6CDxe5GH2oXeEGs/kpwq+JTy+0F/D6RG98QJIdO1avYWfgJ1XHhmeE4O
 wHt8UUyepcfChmtz7nDidi/6x3pnMZXLRNhakCJNxGZ3SSn6FsBjsaTjruKs0A1z4EE2
 izAq6Qs34SNH9yreZ4uVraPfEHO+dnR3VfsJr+k5XwnMTYDUvmMtbNsZkc/0F14eyEUg
 To6gmai5KsPD07idBfG1x3xnzwJiNv7Q0GWMhqnOuToXaRbTCrwazCGEsuhrUJ7DDQpn Vg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2v5btqbhjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 12:55:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8QChr1D098396;
 Thu, 26 Sep 2019 12:55:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2v8w5ka3gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 12:55:56 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8QCtooO015468;
 Thu, 26 Sep 2019 12:55:51 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Sep 2019 05:55:50 -0700
Date: Thu, 26 Sep 2019 15:55:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190926125538.GF29696@kadam>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569539290-756-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569539290-756-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9391
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909260121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9391
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909260121
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <vijendar.mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 5/5] ASoC: amd: ACP powergating should be
 done by controller
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

On Fri, Sep 27, 2019 at 04:37:39AM +0530, Ravulapati Vishnu vardhan rao wrote:
> +static int acp3x_power_on(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout = 0;
> +	int ret = 0;
> +
> +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +	if (val) {

Flip this around.

	if (!val)
		return 0;

> +		if (!((val & ACP_PGFSM_STATUS_MASK) ==
> +				ACP_POWER_ON_IN_PROGRESS))

Use != insead of !(foo == bar).

	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)

> +			rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> +				acp3x_base + mmACP_PGFSM_CONTROL);
> +		while (true) {
> +			val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +			if (!val)
> +				break;

return 0;



> +			udelay(1);
> +			if (timeout > 500) {

if (timeout++ > 500) {


> +				pr_err("ACP is Not Powered ON\n");

We print two error messages.  :/


> +				ret = -ETIMEDOUT;

return -ETIMOUT;

> +				break;
> +			}
> +			timeout++;
> +		}
> +		if (ret) {
> +			pr_err("ACP is not powered on status:%d\n", ret);
> +			return ret;
> +		}
> +	}
> +	return ret;
> +}

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
