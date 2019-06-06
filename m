Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B408B38185
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4786D178B;
	Fri,  7 Jun 2019 01:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4786D178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862232;
	bh=NTj5fGI0Ur7xAM25pNnuIU8K4jnb6e611SIsKfTxUXk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aWqyPDEGrj9NULpLxFBCi9PdBb68MVQD5sBcrmi74BGRb5BWoYWhXDUbCCPQuXq5X
	 smFau/BSdDGd7y66LmxxndDM7XbBntUypc32y2/BILE8t+qCqqSuC9eUw/z1vUWs+k
	 pp85WKgXK2PNIjEJnXexabkgsUVvgrd78G7MUIWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0D56F89A62;
	Thu,  6 Jun 2019 23:32:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC940F898AF; Thu,  6 Jun 2019 23:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7D7F89811
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7D7F89811
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VF9t96rU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zorNv4AxSTTO4Ntrb5SwYBi6FUCQhp3LEGtuoreXT7Q=; b=VF9t96rU1dDO
 575hmDmQ5vzpb17HH6n0e/VDfLCJS8OChBNZ1wBZgx/uhp7kvYHSypXgp0/FrFAfz1oNoFcnrby7/
 v5IUOhEAp6pTJJTr00yd0LWi93zgHn69/hpwET0vgk0TVapWTKRDDi33vGOjxJeHEyjOger2vHqRG
 elP6A=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzun-0007Ux-R0; Thu, 06 Jun 2019 21:27:17 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 50979440046; Thu,  6 Jun 2019 22:27:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0jrmku4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212717.50979440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:17 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc.h: add sound dai_link connection
	macro" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc.h: add sound dai_link connection macro

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 587c984427bf7d031a2a4b693dfb24a51cd660b2 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:07:42 +0900
Subject: [PATCH] ASoC: soc.h: add sound dai_link connection macro

Modern style dai_link requests CPU/Codec/Platform component
pointer array and its size, but it will be very verbose code.
To avoid such scene, this patch adds dai_link connection macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  | 88 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c |  7 ++++
 2 files changed, 95 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index ae7ca828e167..0fa79b8330d7 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1048,6 +1048,94 @@ struct snd_soc_dai_link {
 	     ((i) < link->num_codecs) && ((codec) = &link->codecs[i]);	\
 	     (i)++)
 
+/*
+ * Sample 1 : Single CPU/Codec/Platform
+ *
+ * SND_SOC_DAILINK_DEFS(test,
+ *	DAILINK_COMP_ARRAY(COMP_CPU("cpu_dai")),
+ *	DAILINK_COMP_ARRAY(COMP_CODEC("codec", "codec_dai")),
+ *	DAILINK_COMP_ARRAY(COMP_PLATFORM("platform")));
+ *
+ * struct snd_soc_dai_link link = {
+ *	...
+ *	SND_SOC_DAILINK_REG(test),
+ * };
+ *
+ * Sample 2 : Multi CPU/Codec, no Platform
+ *
+ * SND_SOC_DAILINK_DEFS(test,
+ *	DAILINK_COMP_ARRAY(COMP_CPU("cpu_dai1"),
+ *			   COMP_CPU("cpu_dai2")),
+ *	DAILINK_COMP_ARRAY(COMP_CODEC("codec1", "codec_dai1"),
+ *			   COMP_CODEC("codec2", "codec_dai2")));
+ *
+ * struct snd_soc_dai_link link = {
+ *	...
+ *	SND_SOC_DAILINK_REG(test),
+ * };
+ *
+ * Sample 3 : Define each CPU/Codec/Platform manually
+ *
+ * SND_SOC_DAILINK_DEF(test_cpu,
+ *		DAILINK_COMP_ARRAY(COMP_CPU("cpu_dai1"),
+ *				   COMP_CPU("cpu_dai2")));
+ * SND_SOC_DAILINK_DEF(test_codec,
+ *		DAILINK_COMP_ARRAY(COMP_CODEC("codec1", "codec_dai1"),
+ *				   COMP_CODEC("codec2", "codec_dai2")));
+ * SND_SOC_DAILINK_DEF(test_platform,
+ *		DAILINK_COMP_ARRAY(COMP_PLATFORM("platform")));
+ *
+ * struct snd_soc_dai_link link = {
+ *	...
+ *	SND_SOC_DAILINK_REG(test_cpu,
+ *			    test_codec,
+ *			    test_platform),
+ * };
+ *
+ * Sample 4 : Sample3 without platform
+ *
+ * struct snd_soc_dai_link link = {
+ *	...
+ *	SND_SOC_DAILINK_REG(test_cpu,
+ *			    test_codec);
+ * };
+ */
+
+#define SND_SOC_DAILINK_REG1(name)	 SND_SOC_DAILINK_REG3(name##_cpus, name##_codecs, name##_platforms)
+#define SND_SOC_DAILINK_REG2(cpu, codec) SND_SOC_DAILINK_REG3(cpu, codec, null_dailink_component)
+#define SND_SOC_DAILINK_REG3(cpu, codec, platform)	\
+	.cpus		= cpu,				\
+	.num_cpus	= ARRAY_SIZE(cpu),		\
+	.codecs		= codec,			\
+	.num_codecs	= ARRAY_SIZE(codec),		\
+	.platforms	= platform,			\
+	.num_platforms	= ARRAY_SIZE(platform)
+
+#define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
+#define SND_SOC_DAILINK_REG(...) \
+	SND_SOC_DAILINK_REGx(__VA_ARGS__,		\
+			SND_SOC_DAILINK_REG3,	\
+			SND_SOC_DAILINK_REG2,	\
+			SND_SOC_DAILINK_REG1)(__VA_ARGS__)
+
+#define SND_SOC_DAILINK_DEF(name, def...)		\
+	static struct snd_soc_dai_link_component name[]	= { def }
+
+#define SND_SOC_DAILINK_DEFS(name, cpu, codec, platform...)	\
+	SND_SOC_DAILINK_DEF(name##_cpus, cpu);			\
+	SND_SOC_DAILINK_DEF(name##_codecs, codec);		\
+	SND_SOC_DAILINK_DEF(name##_platforms, platform)
+
+#define DAILINK_COMP_ARRAY(param...)	param
+#define COMP_EMPTY()			{ }
+#define COMP_CPU(_dai)			{ .dai_name = _dai, }
+#define COMP_CODEC(_name, _dai)		{ .name = _name, .dai_name = _dai, }
+#define COMP_PLATFORM(_name)		{ .name = _name }
+#define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
+
+extern struct snd_soc_dai_link_component null_dailink_component[0];
+
+
 struct snd_soc_codec_conf {
 	/*
 	 * specify device either by device name, or by
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f86ee4f48f06..9bd6b08d79b5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -57,6 +57,13 @@ static LIST_HEAD(unbind_card_list);
 #define for_each_component(component)			\
 	list_for_each_entry(component, &component_list, list)
 
+/*
+ * This is used if driver don't need to have CPU/Codec/Platform
+ * dai_link. see soc.h
+ */
+struct snd_soc_dai_link_component null_dailink_component[0];
+EXPORT_SYMBOL_GPL(null_dailink_component);
+
 /*
  * This is a timeout to do a DAPM powerdown after a stream is closed().
  * It can be used to eliminate pops between different playback streams, e.g.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
