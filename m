Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02C1B9907
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 09:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416A51665;
	Mon, 27 Apr 2020 09:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416A51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587973880;
	bh=UmieLukQ49Kq4ufux/+YjleqSZhlUbpOtjKEz0k3Ui4=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tXCY4zBZ2+Rl6w6o0YRIBZ7rl1qKisKK98dahisNvkH5n0JyBQrPU+rRsnNYZuMh0
	 4DdQPFHkW88g9Tub+zZVLwmgYfW937OWBUr/jFjcRXYh0NWp57U9J3KIJCnFAeUfjk
	 4LHxB+YXAGGfIskyVW9obwxtTbYQzBM+IHmFTQOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B71EF80245;
	Mon, 27 Apr 2020 09:48:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9105CF80217; Mon, 27 Apr 2020 09:48:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E3BF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 09:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E3BF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="vE6GKG3W"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200427074842euoutp024ada526580c91ac93e1a2c0a78987d65~Jna-3sxFk3002830028euoutp02g
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 07:48:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200427074842euoutp024ada526580c91ac93e1a2c0a78987d65~Jna-3sxFk3002830028euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587973722;
 bh=mknZsA/0FDTdTGPjnvNOmRPe3XSulv69+2PLJFu+0Xg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vE6GKG3WvE0AYOo8F6W+BKangggSShoOal0b6UOJTflcwvNk6g20TeGyoBq6VYaA/
 Mib9Oqvx00qbimuyRQzpBLTpJpTTazyDmwVV4srRpC3LVOVV+BNd+YY/AcKQDLnTBC
 SZkehxK31A7O/5pYHrwt8GvnXPCDGPk19GiG+T8Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200427074842eucas1p264ba5ffe000219575f29b012c99818d7~Jna-j0Aih0177601776eucas1p2Q;
 Mon, 27 Apr 2020 07:48:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 23.B1.60698.A5E86AE5; Mon, 27
 Apr 2020 08:48:42 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485~Jna-Kc8Sv0342003420eucas1p1f;
 Mon, 27 Apr 2020 07:48:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200427074841eusmtrp1340ac1bc2bbe77ccbd6c6bebeb292812~Jna-J0pBE0061900619eusmtrp1M;
 Mon, 27 Apr 2020 07:48:41 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-fc-5ea68e5a9506
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CB.7D.08375.95E86AE5; Mon, 27
 Apr 2020 08:48:41 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200427074841eusmtip2aac658b2ba3ff637c086e8909101443f~Jna_qYR-f0786807868eusmtip2Q;
 Mon, 27 Apr 2020 07:48:41 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/4] Minor WM8994 MFD/codec fixes
Date: Mon, 27 Apr 2020 09:48:28 +0200
Message-Id: <20200427074832.22134-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSbUhTURzGOXu5uxvduG6CBwurQUJCvqDFhTIMyu4XQeiLGM6mXl9oL7ar
 lmJlSqZDpSwzzMCXdGqYa5mWmuk2NVCGbiMNZ6Zk6tAMl6JLq92u6bffOc//Oc/Dn4Nyxbf5
 vmiaKoPSqOQKKSLidQxuWo7HljXKglfnJIR9zMghKma+IoT9jgEQ02sDgFi3F3EIW1c1QrSa
 pwSEa+U9nzAt3eVHCEm9Kx8h31ZNCUhDSzFCOj72IGRl9R9AlrW3ANJl8IsWxIpOJ1GKtCxK
 E3TmsijVtGDmplcg1zsnvgnyQCFfC4QoxMOgY2Ud0QIRKsabABzvKweMIMZ/Avj0RyQruAAs
 mO3YdUxsdwNW0AFYXty55+h2qxhG8BCoXdYiDHvjMqirr+EwBi7uBtC1auAwggQn4KfJNh7D
 PPwoXBt59Y8xPByamvp5bNoh+Fzfx2XZhcBCfQDL56B1vHlnRgKdQ+0Clg/C4QclPCYM4gUA
 zlhaBeyhBEBb/mPATp2CDovbUw/1VDoG27qCGIT4WXh/0ovF/XBi2YsZ5nqwvKOSy15jsKhQ
 zL7hD6uGXuym9o9ad1qScHzDvLOSOPjrpQ7cA35Ve1E1ALQAHyqTVqZQdKiKuhZIy5V0piol
 MFGtNADPxxj+PbT2BvRuJRgBjgLpPgztbJCJ+fIsOltpBBDlSr2x2dRGmRhLkmfnUBp1vCZT
 QdFGcADlSX2w0LrFODGeIs+grlBUOqX5r3JQoW8eyLGprILauSz7Ahn1OVypJmNuOUYu5oZN
 H5mcn8LM2WPBj/RfkueSByLieWrL4MMTH+puPFEtG+u35k3DkSs6H9w9uq2wOoorp2OQ720b
 zgvqxKv5wqgloWgRnJS8Tri52Zv77B04X1p7WNDjvGS2qZ1Lzbh/KeaWOKIjGqQ8OlUeEsDV
 0PK/TznsmRQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsVy+t/xe7qRfcviDLadM7W4cvEQk8XUh0/Y
 LK60bmK0uP/1KKPFtysdTBaXd81hs1h75C67xef3+1ktDr9pZ3Xg9NjwuYnNY+esu+wem1Z1
 snncubaHzWP6nP+MHn1bVjF6fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hs
 HmtlZKqkb2eTkpqTWZZapG+XoJdx+MUR5oKpbBXbbzxjb2BsY+1i5OSQEDCRuPF3N2MXIxeH
 kMBSRokDp34wQiRkJE5Oa4AqEpb4c62LDaLoE6PEm6/fmUESbAKGEl1vQRKcHCICCRKHlrcw
 gxQxC/xjlHj36CZYkbCAhcTN2+tZQGwWAVWJr2c2g9m8ArYSh1ccZIHYIC+xesMB5gmMPAsY
 GVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIEhuu2Yz8372C8tDH4EKMAB6MSDy/H9qVxQqyJ
 ZcWVuYcYJTiYlUR4H2UsixPiTUmsrEotyo8vKs1JLT7EaAq0fCKzlGhyPjCW8kriDU0NzS0s
 Dc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MDoVVoW+ZWhqqt9y0etl1hG+zNDp
 j22eKX0Rc7wUbRt059RMdm2BFwpKSUf3bBWfVOe90dTA6mfemTtVwUrOX0wPH+Ars3Szm26f
 vu/6pFMeRv5WhilafDv3P18isW3rIoOnqbbFSs8ClleJvezWuLBY3+uJ5cxlFVOvrO3WOdOp
 ebBFMaZUT4mlOCPRUIu5qDgRALprxGJtAgAA
X-CMS-MailID: 20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485
References: <CGME20200427074841eucas1p10523e8e342a8fa2d7cdfb2bc4e25d485@eucas1p1.samsung.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
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

Hi!

This is a resend of the minor WM8994 MFD/codec driver fixes posted in
last days of the February 2020:

https://lore.kernel.org/patchwork/project/lkml/list/?series=431296
https://lore.kernel.org/patchwork/project/lkml/list/?series=431721

I hope this time the patches will find their way to mainline.

Best regards,
Marek Szyprowski


Patch summary:

Marek Szyprowski (4):
  mfd: wm8994: Fix driver operation if loaded as modules
  mfd: wm8994: Fix unbalanced calls to regulator_bulk_disable()
  mfd: wm8994: Silence warning about supplies during deferred probe
  ASoC: wm8994: Silence warnings during deferred probe

 drivers/mfd/wm8994-core.c | 8 +++++++-
 sound/soc/codecs/wm8994.c | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.17.1

