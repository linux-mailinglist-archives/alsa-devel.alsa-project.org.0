Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3D56875E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E482C16D4;
	Wed,  6 Jul 2022 13:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E482C16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108488;
	bh=6u3vE2vJ+16gqEUktTB6PgwwCoCDZi/bgX96rMHSZ6g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phz9T9MhI/y5xqy9yxi0JZ7TWnxdJMIlzp3tQZNq+YSXeAc48dza0GOxWDhPhYkQC
	 1o/xX62EGCWbNkHwH7lRlvzE8lF9fkJ9lcCBQOGWgEINV3CoZ1xV9UV7H9VingPjaq
	 l0JuY+wFBgDK7eWPygqG86wezZXjqdvpnxMBWSlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A4CF8054A;
	Wed,  6 Jul 2022 13:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36C53F80539; Wed,  6 Jul 2022 13:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87C72F8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C72F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yq05ITQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108363; x=1688644363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6u3vE2vJ+16gqEUktTB6PgwwCoCDZi/bgX96rMHSZ6g=;
 b=Yq05ITQ0rrNBgveTX5svsyXfWthGd4H3zw8qG/YHy5NNcPrAImjuxs/1
 b025DcMBbZzamMCcXV1mbJTPdWxjUy/UJUjd1cAuQqsxu0VOmqHu1DOOo
 aK+4NptpxLLc8lvKdJmzjZkPrmzv9IyiZa5fCK05+IaY/5t3+5feRUxkE
 ydPy7pLRYIqS1weg1pEvHYFY0vakRXI8jWf74LA26HJh+1c4gVa3iri6G
 6XNlca9AxZze2gUEwCpO6Fesc7carttYZ1PvvM3Q8J0RZ+XXluH8VotZt
 mXfBNa0R9XvDTdGrF6OulTaBM6ZPpHnVXKGbT2LwdTq4d2/invWwqbdBa A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042611"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042611"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136263"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 2/9] ALSA: hda: Fix null-ptr-deref when i915 fails and hdmi is
 denylisted
Date: Wed,  6 Jul 2022 14:02:23 +0200
Message-Id: <20220706120230.427296-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706120230.427296-1-cezary.rojewski@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

If snd_hda_hdmi_codec module is denylisted and any event causes i915
enumeration to fail, is_likely_hdmi_codec() ends in null-ptr-deref.

As snd_soc_hda is an ASoC-based driver, its initialization is delayed
until all the necessary components appear in the system - allowing
actual sound card to enumerate. snd_hda_codec_configure() gets called by
the avs-driver core during probe_codecs() but the
snd_hda_codec_device_new(), necessary to complete codecs initialization,
happens only when codec-component of hda sound card is being probed.

Denylisting snd_hda_codec_hdmi module causes snd_hda_codec_configure()
to reach: codec_bind_generic() -> is_likely_hdmi_codec() which makes use
of ->wcaps and at this point the it isn't initialized yet - again,
requires completion of snd_hda_codec_device_new().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_bind.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index c572fb5886d5..cae9a975cbcc 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -248,6 +248,13 @@ static bool is_likely_hdmi_codec(struct hda_codec *codec)
 {
 	hda_nid_t nid;
 
+	/*
+	 * For ASoC users, if snd_hda_hdmi_codec module is denylisted and any
+	 * event causes i915 enumeration to fail, ->wcaps remains uninitialized.
+	 */
+	if (!codec->wcaps)
+		return true;
+
 	for_each_hda_codec_node(nid, codec) {
 		unsigned int wcaps = get_wcaps(codec, nid);
 		switch (get_wcaps_type(wcaps)) {
-- 
2.25.1

