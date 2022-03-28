Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734954E9D3F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101D518AD;
	Mon, 28 Mar 2022 19:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101D518AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648487844;
	bh=TPlo02GVT00uKwn/r0/jcn3Y3EgeGT6MHr7yKv3U8A4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J2vjH8HIJzzh2/0IrshXs394Sqqy/iW0JJ3UmHgq7z/r0wxyaGJSLrUKtUOiACdZB
	 TX4pwRAbfEKHA10KH6ygHmrcA4N9IGocIfYvW78NiJu+LZgid9DO9xcdmn2Ms7I0Pz
	 nCqolB/Xi5kOZiGYhhmlIJ6HgdaU+Z7qnkOPsht8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF18F80271;
	Mon, 28 Mar 2022 19:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70D80F800FA; Mon, 28 Mar 2022 19:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED05BF800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED05BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HwB5xgdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487773; x=1680023773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TPlo02GVT00uKwn/r0/jcn3Y3EgeGT6MHr7yKv3U8A4=;
 b=HwB5xgdMyjPcS1UbMRPCshxO26nFJp7egsyIKpmv6RuiSaLpc9XG105G
 5XtdLdMPhlNDwAftV0jq17wNvBd1ckpQ+xLqJnMwkJW+wefbzlJr+C9Jn
 lFSbZCZFjgaqhZCfYrJ3DzwdQVkEttPWn867+QreXydLojZPRcE2mVtdQ
 jfz/37RxH3hDnJi3ateSRrk9ShzTDSm9/u28mSeyAmUpsOEMBG1yBY3BT
 nGnEbDGFYDl1aYC6jk1mDMEk90wAS8FVsgRIPmEAL57/HRmevPGZoj0RD
 iKEsWKCSV7WukgZnZ0IiuwlZPjHDrfca8QFUsU5SHPySXzMnJ+g+5IRHo Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494406"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494406"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141331"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:13:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/14] ASoC: Intel: avs: Topology and path management
Date: Mon, 28 Mar 2022 19:23:56 +0200
Message-Id: <20220328172410.761309-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

A continuation of avs-driver initial series [1]. This chapter covers
path management and topology parsing part which was ealier path of the
main series. The two patches that represented these two subjects in the
initial series, have been split into many to allow for easier review and
discussion.

AVS topology is split into two major parts: dictionaries - found within
ASoC topology manifest - and path templates.

Dictionaries job is to reduce the total amount of memory
occupied by topology elements. Rather than having every pipeline and
module carry its own information, each refers to specific entry in
specific dictionary by provided (from topology file) indexes. In
consequence, most struct avs_tplg_xxx are made out of pointers.

Path templates are similar to path descriptions found in skylake-driver
and they describe how given path shall look like in runtime - number of
modules and pipelines that shape it and how they are laid out. A single
path template is tied either to FE or BE and thus at most to a single,
user-visible endpoint when speaking of FE.

Path is a software representation of its ADSP firmware equivalent. It's
a logical container for pipelines which are themselves containers - this
time for modules i.e. processing units.
Depending on the number of audio formats supported, each path template
may carry one or more descriptions of given path. During runtime, when
audio format is known, description matching said format is selected and
used when instantiating path on ADSP firmware side through IPCs.


Changes RFC -> v1:
- Plenty of rewordings and spelling fixes as requested by Pierre
- any sysfs-functionality-related left in RFC dropped, will be part of
  separate subject in the future
- separated parsing of formatted strings into: "Support link_mask
  formatted string" patch, increasing series size to 14 patches


[1]: https://lore.kernel.org/alsa-devel/20220207122108.3780926-1-cezary.rojewski@intel.com/T/#t


Cezary Rojewski (14):
  ASoC: Intel: avs: Declare vendor tokens
  ASoC: Intel: avs: Add topology parsing infrastructure
  ASoC: Intel: avs: Parse module-extension tuples
  ASoC: Intel: avs: Parse pplcfg and binding tuples
  ASoC: Intel: avs: Parse pipeline and module tuples
  ASoC: Intel: avs: Parse path and path templates tuples
  ASoC: Intel: avs: Add topology loading operations
  ASoC: Intel: avs: Support link_mask formatted string
  ASoC: Intel: avs: Declare path and its components
  ASoC: Intel: avs: Path creation and freeing
  ASoC: Intel: avs: Path state management
  ASoC: Intel: avs: Arm paths after creating them
  ASoC: Intel: avs: Prepare modules before bindings them
  ASoC: Intel: avs: Configure modules according to their type

 include/uapi/sound/intel/avs/tokens.h |  126 ++
 sound/soc/intel/Kconfig               |    2 +
 sound/soc/intel/avs/Makefile          |    3 +-
 sound/soc/intel/avs/avs.h             |   23 +
 sound/soc/intel/avs/path.c            | 1008 ++++++++++++++++
 sound/soc/intel/avs/path.h            |   72 ++
 sound/soc/intel/avs/topology.c        | 1600 +++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h        |  194 +++
 8 files changed, 3027 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/sound/intel/avs/tokens.h
 create mode 100644 sound/soc/intel/avs/path.c
 create mode 100644 sound/soc/intel/avs/path.h
 create mode 100644 sound/soc/intel/avs/topology.c
 create mode 100644 sound/soc/intel/avs/topology.h

-- 
2.25.1

