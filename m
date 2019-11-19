Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C0102588
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 14:36:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9A5168C;
	Tue, 19 Nov 2019 14:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9A5168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574170597;
	bh=SKz6xbVZvTyOL5nAcZAB0ztPc/p97zw0EWWC5mFwKvE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THLGQNbKf+IxSqz/Zpnk+qaE8cmJUZQn6it7alHUM9JyW/DCLx8IOz72AWWta9G5I
	 OiLiCuz/WcztNTkFuL3Oc6bfYc0M1D8X+d/ykGvLS5wdi2WEhvrcIapr6Je2wQQCQ0
	 aKijGGQLPJcjyEZcalutxnnHPHb8UfSv7PWWizg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE29F80137;
	Tue, 19 Nov 2019 14:34:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D189EF80138; Tue, 19 Nov 2019 14:34:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12661F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 14:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12661F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ERpzotDS"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJDYJsw142439;
 Tue, 19 Nov 2019 13:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=zeT1T5F4u/9t9rqf7pRcWtmarJGMaGO5YjAnx2eEqyo=;
 b=ERpzotDSLHZmw2HCw7RKqcEvDqjcLJRsdk7QizAlNvOKi0LhoStogrFjvgiyf//iMCeR
 pU98NNr39sva/nm9BsKBfmUQqTqQAUwUshf/SrB/Q+tkuU11pNEEUykOCVKxbYedLVbq
 6I7G/wqLRC1vtPUPaLV7MRyg60gpJxMlJ2uF8dHVuplQGImtoxOlUMzFfIVcANf0gkb5
 T4vKCvgWcxD2svCxH3OSOWXMa3ix52480yQto2fyxkFEZrRf0SdhixWXysHTqOtqIqex
 a8SeLc7rUmnu68q/Jj/1lzYEOaa/kY4buLqBG5d5RkLkcR0KTNeloZptD6SuFbmzxInM 9w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2wa8htpxbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 13:34:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJDVkE7105282;
 Tue, 19 Nov 2019 13:34:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2wc0agdf4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 13:34:44 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAJDYbd0020028;
 Tue, 19 Nov 2019 13:34:37 GMT
Received: from kadam (/41.210.141.188) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 05:34:35 -0800
Date: Tue, 19 Nov 2019 16:34:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: vishnu <vravulap@amd.com>
Message-ID: <20191119133416.GB30789@kadam>
References: <1574165476-24987-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574165476-24987-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191119123531.GA30789@kadam>
 <3321478e-de8f-2eb6-6e6f-6eb621b8434b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3321478e-de8f-2eb6-6e6f-6eb621b8434b@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911190124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911190125
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Alexander.Deucher@amd.com,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [alsa-devel] [RESEND PATCH v9 6/6] ASoC: amd: Added ACP3x
 system resume and runtime pm
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

On Tue, Nov 19, 2019 at 06:26:17PM +0530, vishnu wrote:
> 
> 
> On 19/11/19 6:05 PM, Dan Carpenter wrote:
> > I can't apply this because I'm not CC'd on patches 2-5.
> > 
> > On Tue, Nov 19, 2019 at 05:41:16PM +0530, Ravulapati Vishnu vardhan rao wrote:
> > > +static int acp3x_power_on(void __iomem *acp3x_base)
> > > +{
> > > +	u32 val;
> > > +	u32 timeout;
> > > +
> > > +	timeout = 0;
> > > +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> > > +
> > > +	if (val == 0)
> > > +		return val;
> > > +
> > > +	if (!((val & ACP_PGFSM_STATUS_MASK) ==
> > > +				ACP_POWER_ON_IN_PROGRESS))
> > > +		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> > > +			acp3x_base + mmACP_PGFSM_CONTROL);
> > > +	while (++timeout) {
> > 
> > while (++timeout < 500)
> > 
> 
> If I check with timeout<500 and in next condition i have
> if(timeout >500) this never happens.

I was maybe not clear enough.  Please don't write:

	while (++timeout) {

That doesn't make sense as a loop.  It looks like you are trying to
loop UINT_MAX times.  Put the ++ and the limit on the same line.

There is only one real bug in my review but there is just a lot of clean
up left.  Can you have a co-worker review your patch before resending?
The patch 1/6 looks pretty good now but I haven't seen patches 2-5 so
I'm worried there is a lot of cleanup left to do.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
