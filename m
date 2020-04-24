Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07AA1B71DC
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 12:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDC216B0;
	Fri, 24 Apr 2020 12:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDC216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587723736;
	bh=3mtC0eSQOwcAfh8OI3iYdObAuk+/yeyYhBoK5T6c3UE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E+7g9TWgq9NL35WTI92ky9dkCTQjTZh/30QQIqmenbT4h9eptKHiNRp96NaiT1zuD
	 1HN5iPdudycU1tHoPkCfI58jbU6vgGbpIfrcivtF6bWYan0PQbYOixE07CmfIocSSM
	 qvb2RbhEt7G5cKCrj4j7dwfpp5UDVn0SK8EqT+C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A47EF801D9;
	Fri, 24 Apr 2020 12:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3616F80142; Fri, 24 Apr 2020 12:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D48F800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 12:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D48F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ds4ObvBq"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03OAJ3ve144895;
 Fri, 24 Apr 2020 10:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FfxNKk4YX5wr1NdBKuhcarzJTM7d0qbafhiFbqUJH74=;
 b=ds4ObvBqaQ+evSf+A+By9cFckWnZR2yfGohUu2VSc0pYIXXFkRWCiqDNc02zYW6BtP2N
 Rv7r/sw4snqf1lbU7cC49HrivF/tk8LuROTcSIsELrsIRgnJUh0zmy1oKyYaJFZ1P8dQ
 BrM+TNpgA9weqF/sDtD+48m5wuoYhUHjktZE5vPTzKIdc0qSId7Hahxx9nCCFktS7GXd
 5LVXW52v2OHul8zsgUhQVP/9kwhEQWnU0czGLnR4JdSxXJYhhEJiwvyL01OKj8st2NpQ
 bI+6jsOGAASAGXd7g4u0B+bEHN2DhgM5+uBqDr+M6LNeMc9wiRhMku2I89e/31bCOqzZ Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 30ketdkjpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 10:20:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03OAHsmZ071945;
 Fri, 24 Apr 2020 10:20:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 30k7qwwnn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 10:20:18 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03OAKFQN017707;
 Fri, 24 Apr 2020 10:20:18 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 Apr 2020 03:20:15 -0700
Date: Fri, 24 Apr 2020 13:20:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: shengjiu.wang@nxp.com
Subject: [bug report] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
Message-ID: <20200424102008.GA414495@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9600
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 mlxlogscore=405
 adultscore=0 suspectscore=10 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004240079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9600
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=478 phishscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 suspectscore=10 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240079
Cc: alsa-devel@alsa-project.org
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

Hello Shengjiu Wang,

This is a semi-automatic email about new static checker warnings.

The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
drivers" from Apr 16, 2020, leads to the following Smatch complaint:

    sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
    warn: variable dereferenced before check 'ctx' (see line 1527)

sound/soc/fsl/fsl_easrc.c
  1526		struct fsl_asrc_pair *ctx = runtime->private_data;
  1527		struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
                                                      ^^^^^
Dereference

  1528	
  1529		if (ctx && (ctx_priv->ctx_streams & BIT(substream->stream))) {
                    ^^^
This check is too late, to prevent a NULL dereference.

  1530			ctx_priv->ctx_streams &= ~BIT(substream->stream);
  1531			fsl_easrc_release_context(ctx);

regards,
dan carpenter
