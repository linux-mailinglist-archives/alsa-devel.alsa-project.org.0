Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731F2F2C98
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 11:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5A3E16C2;
	Tue, 12 Jan 2021 11:23:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5A3E16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610447047;
	bh=RnZjQFvCeeTbsczSRfIO3GbLXa7rKFawHGrA+wvHK1s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F8gDVli33EPvlIaNi+7W7QEx1NtNmWyDMrSaNC5F1f9AEyUPzwStWyhjPx4oDMV2d
	 vubxqqpAtFECUQApPNLBZpb600YaM/1Cv20GmpRinAwEZ7IA7QzQEM/9KEh4aUdFGX
	 GA6/kdTi/WmZDfYRdM9tTyDsaPutwOZgLPZ8vT1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2637DF800B9;
	Tue, 12 Jan 2021 11:22:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06FF2F8025E; Tue, 12 Jan 2021 11:22:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3ACAF800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 11:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3ACAF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="zHv5eZFX"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10CAFkdF109075;
 Tue, 12 Jan 2021 10:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=NRQDdhTGtnTTrpO9FnIJpdb3eQWLHU5Bkcmb0yFI+AY=;
 b=zHv5eZFXwOnIJDLvbc8iAFW0u7fewFHY7RiWQtExujibYF7JKVDhL3XLrVbSoLE5LiXU
 OgZfl68vUVQp+upANn8CyDywLfUT7EWtIjgGjFUrnlRove67+SniNPVtSnnd4BhByA2M
 7XS6SpPsTqmsu7xebx7vnDEr2TWfFv3GI+aum4Wcam9h5/u/BjM6aHMGivc4O/c90261
 Kbu4sB70XyI2D+kuKGd66ojzX+MKpqcWq2XN/CoO5VTvxO+OiJzAvcFYOblOGJFXH8Jt
 QvWgBE9EBOyw3ttQaVsM6IXrKWYBLSa8vhFXRahOZnnSyfxbgaQ6tYqRYMtHUC4g+l8j Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 360kvjwhcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Jan 2021 10:22:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10CAGiEB018798;
 Tue, 12 Jan 2021 10:22:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 360kf561e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 10:22:17 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10CAMDCd011228;
 Tue, 12 Jan 2021 10:22:13 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Jan 2021 02:22:12 -0800
Date: Tue, 12 Jan 2021 13:22:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in
 variable ret
Message-ID: <20210112102204.GG5083@kadam>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
 <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120055
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 =?utf-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Mon, Jan 11, 2021 at 05:37:36PM +0000, Colin Ian King wrote:
> On 11/01/2021 16:35, Mark Brown wrote:
> > On Fri, Jan 08, 2021 at 12:35:46PM +0000, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> Currently when attempting to start the BE fails because the
> >> FE is not started the error return variable ret is not initialized
> >> and garbage is returned.  Fix this by setting it to 0 so the
> > 
> > This doesn't apply against current code, please check and resend.
> > 
> 
> Current ASoC tree now has two commits:
> 
> commit 4eeed5f40354735c4e68e71904db528ed19c9cbb
> Author: Souptick Joarder <jrdr.linux@gmail.com>
> Date:   Sat Jan 9 09:15:01 2021 +0530
> 
>     ASoC: soc-pcm: return correct -ERRNO in failure path
> 
> commit e91b65b36fde0690f1c694f17dd1b549295464a7
> Author: Dan Carpenter <dan.carpenter@oracle.com>
> Date:   Mon Jan 11 12:50:21 2021 +0300
> 
>     ASoC: soc-pcm: Fix an uninitialized error code
> 
> ..both set ret to non-zero, which I believe will throw a subsequent
> warning messagethat's not strictly related.

My patch restored the original behavior.  And I think that errors should
return error codes.  What you're saying is basically "Returning an error
is a bug because it will trigger an error message in the caller".  So
then we have to have a debate about printks as a layering violation.

I don't like error messages generally, because I think they make the
code messy.  A lot of people put error messages for impossible things.
Or if a kmalloc() fails or whatever.  There are too many error messages
which people add in an auto-pilot way without considering whether it's
necessary.

But some people think, and maybe they're correct, that it's best if
every function in the call tree prints a message.  That way you can
trace the error path easily.

regards,
dan carpenter

