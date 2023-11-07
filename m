Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367D7E36B5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 09:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 791FB4E;
	Tue,  7 Nov 2023 09:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 791FB4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699346034;
	bh=hPu9nRwaiqNlDBcW8EvtIxJTSCrKe1Hinta027vfqP0=;
	h=From:To:Subject:Date:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QurpbwpggirZqKk4k/cumdGLZApPqjKJawJ4lS0kBY8TNgghoGBrCkAffF/VcSR8e
	 l5sAVwDSBMmYzTLqNyOk0x4qRJ7pqOzhgAxl2dSwR1n8q5kkRt9fzZORePVDTeJqZi
	 l4yppc4amOl+Zyj0lQ5JxzbS+TlTXOYEee2WZ/L8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7D55F80557; Tue,  7 Nov 2023 09:32:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE9E8F80169;
	Tue,  7 Nov 2023 09:32:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06EBEF80152; Tue,  7 Nov 2023 09:24:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 456A9F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 09:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 456A9F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=pkQF0Dsi
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20231107082306epoutp019e16b1d863e1fdc99b67a0415af5274d~VSaAcjD8D3174531745epoutp019
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 08:23:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20231107082306epoutp019e16b1d863e1fdc99b67a0415af5274d~VSaAcjD8D3174531745epoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699345386;
	bh=YTwsE0aLlHvlMtYSLT2ZLr4SuRKlaDRwueq6TuZ9dxA=;
	h=From:To:Subject:Date:References:From;
	b=pkQF0DsivQKYnJpBdOGMm4GjcbkazaWDCOA0EBrQN3OdUfcrp5S9x9KqAPLLJWM+5
	 TFRRU805VMo4jUOQzyOicdmkrOMsvhAqccU2ULY7ryQVTI1UwNCf7AbOXJsk3sxcYy
	 Wi7KhM0gvKzKn59dolf6J+/OsLf5KVY3CI92iZvI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20231107082305epcas2p46f2baa8c75b4762fc528d6207ebe1a1f~VSaABql1-1724417244epcas2p4Y;
	Tue,  7 Nov 2023 08:23:05 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp4.localdomain
	(Postfix) with ESMTP id 4SPh6x6gxNz4x9QC; Tue,  7 Nov 2023 08:23:05 +0000
	(GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf~VSVslgGKU2753327533epcas2p2b;
	Tue,  7 Nov 2023 08:18:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231107081810epsmtrp2c37f370a3c666e6f3412fb9b0bb624c6~VSVskyGtw0763107631epsmtrp2W;
	Tue,  7 Nov 2023 08:18:10 +0000 (GMT)
X-AuditID: b6c32a2a-a1b3aa8000002271-9e-6549f2c26c9f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C0.1E.08817.2C2F9456; Tue,  7 Nov 2023 17:18:10 +0900 (KST)
Received: from KORDO035882 (unknown [12.36.182.71]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231107081809epsmtip14d0843cd803cb389ee8ba7b0f3ac2464~VSVsTFvzW3265732657epsmtip1C;
	Tue,  7 Nov 2023 08:18:09 +0000 (GMT)
From: =?ks_c_5601-1987?B?sK29xcf8?= <s47.kang@samsung.com>
To: <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
	<tiwai@suse.de>, <lgirdwood@gmail.com>,
	<pierre-louis.bossart@linux.intel.com>, <broonie@kernel.org>,
	<cpgs@samsung.com>, <pilsun.jang@samsung.com>, <seungbin.lee@samsung.com>,
	<donghee.moon@samsung.com>, <s47.kang@samsung.com>
Subject: [PATCH] ALSA: core: Replace mutex_lock with mutex_trylock
Date: Tue, 7 Nov 2023 17:17:59 +0900
Message-ID: <664457955.21699345385931.JavaMail.epsvc@epcpadp4>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdoRUYAmTaFEU0JCSqqAucOD379Z/w==
Content-Language: ko
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWy7bCSnO6hT56pBme2slhcuXiIyWLqwyds
	Fi8PaVpc+nSe3eLV4V2MFt+udDBZ/Pr/jMni6MXFTBYNd5vZLSbefc1u8XLzGyYHbo8Nn5vY
	PHbOusvusWlVJ5vHvJOBHt/OTGTx6NuyitFj8+nqAPYoLpuU1JzMstQifbsErozXK78zFmwU
	qDi2fD1zA+MD7i5GTg4JAROJj7dWMYLYQgK7GSXefBaEiEtIfNv5lQXCFpa433KEFaLmGaPE
	9/0JIDabgJXE3aYpbF2MXBwiAvuYJP7PnswEkhAWcJK40nIDzGYRUJE4vOEF2CBeAUuJTUfm
	sEPYghInZz4BizMDHdF4uBvKlpfY/nYOM8RiBYmfT5eBLRYR0JP49KCbEaJGRGJ2ZxvzBEaB
	WUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcPVpaOxj3
	rPqgd4iRiYPxEKMEB7OSCO9fe49UId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzfXvemCAmkJ5ak
	ZqemFqQWwWSZODilGpgs9iXdEZL4vsDA7kEaB5fH2lqm0o28PzW+zbpx6+YxNf05LaVr157T
	ejjjZ+JPFT3Jp7pfDPWfnppu+XfzsfsXLTa4roquPPw+aOY+pv21BwsEZge3L1JiPGMmYlC4
	4qHFz6wqA9Y7W9N3zFvrxKm2zttMZwVLpnajYkXW44AnlrOCl/ZODJgqdNZ006oVcSaNmac2
	vJ3IOVHj3tJ1uYs5jq58fz3g5euu6H2qBvFz9mjNYd/+x94u33jCFdGq/2l7ns5/ay/c+3Hj
	46Y1ky1Pzz+14c3u1O2MjjftDmycEHGiny/nqErMdZFrK+pnOHxZlFBTaBuy7MqTrT6rL8yy
	lfKO2xj39bPWySv5Fj/9a5VYijMSDbWYi4oTAUuMYlINAwAA
X-CMS-MailID: 20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf
References: 
 <CGME20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf@epcas2p2.samsung.com>
Message-ID-Hash: PBYDC636D2T4XDSBAY4ZVUTAZRFJVTTT
X-Message-ID-Hash: PBYDC636D2T4XDSBAY4ZVUTAZRFJVTTT
X-MailFrom: s47.kang@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBYDC636D2T4XDSBAY4ZVUTAZRFJVTTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Task1 waits for mutex_lock, and task2 waits for pde to be unused.(deadlock)
/*call trace*/
    task1 Call trace:
            __switch_to+0x174/0x338
            schedule+0x7c/0xe8
            schedule_preempt_disabled+0x24/0x40
            mutex_lock+0x40/0xec
            snd_info_text_entry_open+0x28/0x120
            proc_reg_open+0xe4/0x248
            do_dentry_open+0x2a4/0x4e0

    task2 Call trace:
            schedule_timeout+0x44/0x1c8
            wait_for_completion+0x18/0x24
            proc_entry_rundown+0x60/0xf0
            remove_proc_subtree+0x180/0x218
            proc_remove+0x20/0x30
            snd_info_disconnect+0x4c/0x68
            snd_info_card_disconnect+0x3c/0x58
            snd_card_disconnect+0x130/0x264
            usb_audio_disconnect+0xc0/0x24c

/*the sequence*/
    task1:
            - proc_reg_open: set the use_pde
    task2:
            - usb_audio_disconnect: usb device disconnection occurs
            - snd_info_card_disconnect: acquire the mutex_lock(&info_mutex)
            - proc_entry_rundown: wait_for_completion(unuse_pde)
    task1:
            - wait for mutex_lock in snd_info_text_entry_open

To avoid it, a mutex without wating(mutex_trylock) shoud be used in
snd_info_text_entry_open(task1).
Then, when mutex_lock acquisition fails, an error is returned, and the pde
becomes unused, and the mutex_lock held by task2 is released.


Signed-off-by: Shinhyung Kang <s47.kang@samsung.com>
diff --git a/sound/core/info.c b/sound/core/info.c
index 0b2f04dcb589..6cb4064b292e 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -369,7 +369,10 @@ static int snd_info_text_entry_open(struct inode
*inode, struct file *file)
        struct snd_info_private_data *data;
        int err;

-       mutex_lock(&info_mutex);
+       if (!mutex_trylock(&info_mutex)) {
+               pr_err("%s: failed to acquire the info_mutex\n", __func__);
+               return -EAGAIN;
+       }
        err = alloc_info_private(entry, &data);
        if (err < 0)
                goto unlock;



