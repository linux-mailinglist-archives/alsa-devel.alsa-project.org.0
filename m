Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E80DB66AFC9
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:52:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9B838BA;
	Sun, 15 Jan 2023 08:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9B838BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769166;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VFUkJaq2+rd5PjI7x86JM25JXsrs7+nnkqnTucd41jy6MegziFOthgdDMr69l4MT3
	 1k8DEQxFaVpIZcmJoqO/6gGQP1M3FXzclzGifJuboPiMPudvuo2D3ZnyqW+hquFtAr
	 T9AtIXjIPm0tHwr4SzJBmqC88v5Yp1HPiCq+xAJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68AE7F805AB;
	Sun, 15 Jan 2023 08:48:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FEC1F8030F; Fri, 13 Jan 2023 13:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,
 RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from st43p00im-ztfb10071701.me.com (st43p00im-ztfb10071701.me.com
 [17.58.63.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50A4BF8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50A4BF8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mac.com header.i=@mac.com header.a=rsa-sha256
 header.s=1a1hai header.b=qi2Oj1bK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
 t=1673612716; bh=+oVvzsrERZqgJ3fcl9RAR80VZ71ww2UFJnb6O/Kv4/g=;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:From:To;
 b=qi2Oj1bK+4rOLRj3GHmm3ZmeJhRKQzqhsg1AWlb5S5wTBeXm7o4glVFLmH3gNNY8t
 SSBIu5ueUyq3e9xKmkx+W/rXjOg+ncP40IfzPMzqfICa7H3CAyl34RXJl1VCLkmOsB
 kIG1hHVm2Kokn0ZXmdZsx8rcqh1vwcXfvVhs2BbgC49+AAyflJU/cJAzhqQ70PsNHT
 9KGC8UaRlVm0AN1NTwg/uXOwGZb2tCYgsf0/tvSrxDLpnexFrHZPpFWQ25mpm1FUq6
 xuimJkM2JpiG+zQtLhI8VMhRseTrPbpf/50xSlG9qNQS/86XdUZI2w0m6iFKdVVcAF
 QcCD/0vsbjgbA==
Received: from [127.0.0.1] (st43p00im-dlb-asmtp-mailmevip.me.com
 [17.42.251.41])
 by st43p00im-ztfb10071701.me.com (Postfix) with ESMTPSA id B36CBA0D46
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:25:14 +0000 (UTC)
X-Mailer: BlackBerry Email (10.3.3.3216)
Message-ID: <20230113122514.5591123.98083.41900@mac.com>
Date: Fri, 13 Jan 2023 05:25:14 -0700
Subject: question about byte alignment (snd_pcm_hw_constraint_msbits and
 SNDRV_PCM_FMTBIT_S32_LE)
From: Gagan Sidhu <beatlesnut@mac.com>
To: alsa-devel@alsa-project.org
X-Proofpoint-ORIG-GUID: tMIu94bK3XOBOBovxZtR4Pmd3v3a9Lmy
X-Proofpoint-GUID: tMIu94bK3XOBOBovxZtR4Pmd3v3a9Lmy
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1031 malwarescore=0
 mlxlogscore=601 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2301130083
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

