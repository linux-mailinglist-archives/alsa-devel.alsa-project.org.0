Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E54FE06
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2019 22:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE95C15E2;
	Sun, 23 Jun 2019 22:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE95C15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561322227;
	bh=6Q7gOzWEY1ai0qUAyDH8/KyTTJcGcEo19eOBwzaua6c=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=So311aT9S39kxdvg6SOT/VQKqAsxUBRsnhwWwLmr7sD9DcHqfy19Yx6lFOHrxgd13
	 1bgJoTdt/dWrJiq9fsQnA1MzkWR1yZ3je0N7MPY62Z7esCFuzU7X4BvF76oxAOVmvq
	 NQ8N79SGDPK3MY1GqCu3qyMYR5PVSgMRYMHGab1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23EC9F896EA;
	Sun, 23 Jun 2019 22:35:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C01AF896F0; Sun, 23 Jun 2019 22:35:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32CE6F8065D
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 22:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32CE6F8065D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="hUJH1exG"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5NKUkQb148357
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 20:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=StKAgyXluy9is8Tlz/GC6v3VqYUFD3TH5i4nkAhneHU=;
 b=hUJH1exGts/LWlbQ00qROiJup42sS/9BHPv8nMjepiiTyxaOdKLiVGSHaUJeLwzk2Ozw
 OxwBQUTjWXtCRWdtPfH5F1lYoGqxZOjR2HYv9xct8Or1AL7eLykNpE7JV7fwzLnfINKg
 xuDagI9z34C4SZCToY9M8eEASsTfKN/kJeK3P1Zi25SWMiEOxxhpa6pBWrStChpkVDQG
 lQ2mJMq/1xweOQgBf00cO69/qBjZ023aT25CfRefW6QDXOkWZwbAWihc2PY8z1q0v4wl
 Z8n5ndNx8rH7YxYea0RlpyK1aa/tYAeNSa8YNx/10cUrH1v80LtkUEuKCy4+swPZN0L7 pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t9c9pb748-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 20:35:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5NKXZxx015760
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 20:35:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t9acb70w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 20:35:15 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5NKZ6th014256
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 20:35:14 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 23 Jun 2019 13:35:05 -0700
Date: Sun, 23 Jun 2019 23:35:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: alsa-devel@alsa-project.org
Message-ID: <20190623203500.GN18776@kadam>
References: <20190619101639.GA29913@mwanda>
 <20190622013522.GA14635@workstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190622013522.GA14635@workstation>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906230177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906230177
Subject: Re: [alsa-devel] [bug report] ALSA: oxfw: configure packet format
 in pcm.hw_params callback
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

On Sat, Jun 22, 2019 at 10:35:23AM +0900, Takashi Sakamoto wrote:
> (sound/firewire/amdtp-stream.c)
> void amdtp_stream_stop(struct amdtp_stream *s)
> {
>     mutex_lock(&s->mutex);
> 
>     if (!amdtp_stream_running(s)) {
>     	mutex_unlock(&s->mutex);
>     	return;
>     }
>     ...
>     fw_iso_context_destroy(s->context);
>     s->context = ERR_PTR(-1);


It might be nice to wrap this assignment in a function call:

void mark_stream_not_running(struct amdtp_stream *s)
{
	s->context = ERR_PTR(-1);
}

Or we could leave it as is...  It doesn't really matter too much.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
