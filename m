Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DB019C93F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 20:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308EC86F;
	Thu,  2 Apr 2020 20:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308EC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585853799;
	bh=NYy5QJ6oMXcCSdGZ3sjeJYJWAuKkZfQx0EiR9gk192g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FnCdW7OCF9bj+TKng+dQDzc7tYka4BHoRGWSa5AfANfbi65d4pT5G8lVG0aFSZqKe
	 HSN5IuNyP2V3EKYW7Mre6SPvaJVYq+boP2dHd4K9CyFjl+Ut/zL1C8twvxl2+6/rrv
	 zZ5zk+UIq5oeXahu77E6CBT2woeYI2JYBngZeXBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681D8F80292;
	Thu,  2 Apr 2020 20:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2ED5F8028C; Thu,  2 Apr 2020 20:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6688AF80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 20:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6688AF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="R+uHHNbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585853653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NYy5QJ6oMXcCSdGZ3sjeJYJWAuKkZfQx0EiR9gk192g=;
 b=R+uHHNbdoMOMaSaC1ty9Td4XMmq8NtSY6r4wsqsW7OP86/Vs/uMpcd/ydZNUQitMFDEi73
 2HxjgyremXJ31PIsFoCwQTS2c8lc4XCVSKsIk+ChxHQI0QnKQVuyfXqoN5vrwt6GgZgP+I
 Of0L4sLU77GjDnmStFlehGT+LWuwRuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Oa7WS05tNx-ZwHzxddfCHA-1; Thu, 02 Apr 2020 14:54:11 -0400
X-MC-Unique: Oa7WS05tNx-ZwHzxddfCHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A4FF8017FD;
 Thu,  2 Apr 2020 18:54:09 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-45.ams2.redhat.com [10.36.112.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F33A10002B0;
 Thu,  2 Apr 2020 18:54:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 flove@realtek.com, shumingf@realtek.com,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 3/3] ASoC: Intel: atom: Fix uninitialized variable compiler
 warning
Date: Thu,  2 Apr 2020 20:53:59 +0200
Message-Id: <20200402185359.3424-3-hdegoede@redhat.com>
In-Reply-To: <20200402185359.3424-1-hdegoede@redhat.com>
References: <20200402185359.3424-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
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

GCC 10 gives a "variable might be used uninitialized" warning for the
block variable in sst_prepare_and_post_msg().

This is a false-positive warning, but lets fix it anyways.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/atom/sst/sst_pvt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/=
sst_pvt.c
index 13db2854db3e..053c27707147 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -223,9 +223,9 @@ int sst_prepare_and_post_msg(struct intel_sst_drv *sst,
 =09=09size_t mbox_data_len, const void *mbox_data, void **data,
 =09=09bool large, bool fill_dsp, bool sync, bool response)
 {
+=09struct sst_block *block =3D NULL;
 =09struct ipc_post *msg =3D NULL;
 =09struct ipc_dsp_hdr dsp_hdr;
-=09struct sst_block *block;
 =09int ret =3D 0, pvt_id;
=20
 =09pvt_id =3D sst_assign_pvt_id(sst);
--=20
2.26.0

