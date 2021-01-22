Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB682FFD38
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199D21AAD;
	Fri, 22 Jan 2021 08:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199D21AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611299754;
	bh=CXtGqnmRUG2a0bHeT3ptxY3AwTzcd7mGw8QrN3z6LDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llT7kvUKliN8fi7VDI4CCE0dt4BNV261GrTpXYmW5Xe/62DT2joNmDCYkrRtBwht+
	 1YhvD0sItOT08Mh0MQiDUUVW8R0FcfqN0MhINU6iISQwZPdCyMhd5MR8LNed4PZoh+
	 qlh5lAeUiJWTasiQWOzHb9/1DG/vRzpFAQevbw4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39C95F8015B;
	Fri, 22 Jan 2021 08:14:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB109F80166; Fri, 22 Jan 2021 08:14:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71A7F8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71A7F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="OTZlfLJ0"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10M74NNh095244;
 Fri, 22 Jan 2021 07:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=O7EATwf1rkmRikMt1iNY1oHNqzV8wg7qlLVFbtCJ02Q=;
 b=OTZlfLJ0k+Il/HxqqSic/v9qhf/6LryNXwGFsLjTKNiTfbB2mWUhc/rGwf+00lJ7seTo
 HcyCxBbGn8HsC4v+IgQbj1KWeHWEL/JX3eEQNmui2MBvTaRNQnhkkCmuVfRkPnBO6I5V
 W5mdeS4HmY3YB0F8Mi2tm713QB3AtA3PSECXK/qTqxeplTCecGXiwYYEZxnZleSnuopt
 m2HbbxVBYNh8jvJvlDpVUxF4cjJNHPvO6aIpoIsmRPc33gTKjxx59RgNcQHgVa0daxk5
 omBwkSvwXl1XMxNFr2QivU+YhAlwxOMkGWw3AT6qNSHHef6YZ1yN/ddh5yo/v/KqQJrb Og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3668qn2pa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 07:14:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10M764vV002218;
 Fri, 22 Jan 2021 07:14:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 3668rh2xp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 07:14:10 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10M7E2wr013106;
 Fri, 22 Jan 2021 07:14:05 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 21 Jan 2021 23:14:01 -0800
Date: Fri, 22 Jan 2021 10:13:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ALSA: fireface: fix info leak in hwdep_read()
Message-ID: <20210122071354.GI20820@kadam>
References: <YAka5xudQNQgRkuC@mwanda>
 <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220036
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220036
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Clemens Ladisch <clemens@ladisch.de>,
 Takashi Iwai <tiwai@suse.com>
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

On Thu, Jan 21, 2021 at 09:42:04PM +0100, Christophe JAILLET wrote:
> Hi Dan,
> 
> Le 21/01/2021 à 07:10, Dan Carpenter a écrit :
> > If "ff->dev_lock_changed" has not changed
> 
> According to the "while (!ff->dev_lock_changed) { ... }" just above and the
> lock in place, can this ever happen?
> 
> In other word, I wonder if the "if (ff->dev_lock_changed)" test makes sense
> and if it could be removed.
> 
> 
> (same for your other patch against sound/firewire/oxfw/oxfw-hwdep.c)
> 

Yeah.  That's a good point.  I'll resend.

regards,
dan carpenter

