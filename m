Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA26102626
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 15:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2938169D;
	Tue, 19 Nov 2019 15:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2938169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574172966;
	bh=RrY+CWqqFxKO6oaolSpFFWtw8T8jplEGZPcYx3uVjoU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkYZyltqNJtOaSaBU6sGRm3YV0SGZ+7uyT7O8aPpKHxlM+kq1vUKDICVEdsJtz2dO
	 3N41PW267GL5NmpNjGdZB5fwY/InHWwPoX4F2qS9nvStjwygc+oQrWj+ZGXu4cCk3e
	 +/CohnjQa08MEm6G752HEnjIvPUQGYQw+AlNqDQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 620C4F80214;
	Tue, 19 Nov 2019 15:11:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE04BF80212; Tue, 19 Nov 2019 15:11:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28338F80135
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 15:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28338F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="f1to4j/Y"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJE92PH173717;
 Tue, 19 Nov 2019 14:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=bwQFXtwG3dvNeoJmnBTqoP3KLfHxP5spSaknn1sb9Ng=;
 b=f1to4j/Y3bnVaqmjY5v/3oVrWd/yZ/6sxLH1MzfAfQV22MxWRulrTVYLB2iiUyU8yhk+
 jcggsbj4hlj8h54yxx32R1AHtu4cq/K1xxLmrLx07eiQRQgbVT4OCUuJtpNsQQGqMXLV
 2nIkEBtycPRHO1SFv9uIIKrEfQ2u46HrDOjIaqniihyhU+WWkHbnrFgZy5YBxFNryCNO
 hm5NiqztqUZYws0MF2XWoL3JFHQtrmkNcX42QXjADE9iM19piepFM3GqGrBotffVQ/vF
 fm92Fg9/a0MT7nZcXrfgJVNphOTyxjBGqpzUSzf8EVO3qG+LJ6t5yAuBGfH94QCQH3Dt rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2wa8htq5af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 14:11:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAJE7wxn051758;
 Tue, 19 Nov 2019 14:11:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2wbxm4b3tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 14:11:15 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAJEB89R004043;
 Tue, 19 Nov 2019 14:11:08 GMT
Received: from kadam (/41.210.141.188) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 Nov 2019 06:11:06 -0800
Date: Tue, 19 Nov 2019 17:10:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: vishnu <vravulap@amd.com>
Message-ID: <20191119141046.GC30789@kadam>
References: <1574165476-24987-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574165476-24987-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191119123531.GA30789@kadam>
 <3321478e-de8f-2eb6-6e6f-6eb621b8434b@amd.com>
 <f7f14463-2249-4414-fc53-3fee0c99862c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7f14463-2249-4414-fc53-3fee0c99862c@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911190131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9445
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911190131
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Nov 19, 2019 at 07:33:08PM +0530, vishnu wrote:
> > > > =A0 static void snd_acp3x_remove(struct pci_dev *pci)
> > > > =A0 {
> > > > -=A0=A0=A0 struct acp3x_dev_data *adata =3D pci_get_drvdata(pci);
> > > =

> > > This was fine.=A0 Leave it as-is.
> > > =

> =

> Actually I  was reported by kbuild robot tool about ISO mixed forbids of
> initialization so I did this.
> =


You misunderstood the warning.  It is about putting declarations after
the start of code.  (Initializers don't count as code in this context).

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
