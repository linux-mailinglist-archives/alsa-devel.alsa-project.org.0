Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07BE16D54
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 23:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B81B17FF;
	Tue,  7 May 2019 23:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B81B17FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557266181;
	bh=SbwiT0i3k02URjQM+MBqb6+cKUf5kIiG6O03iNM8tGs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kVs6TA2LWSUoG6RUSVPip91hPcpN+UmAZZdHB347nTfgZZxZmWQIMERlwfZ3dQ3vr
	 VbmUFAkoJikkcyGMNJH4c+jUf2W5VixpHQ2JsCJ/HTDyBu6Rzm0rPonDfFd+7mn3yH
	 6h+F0h7ozBD6/TASNwa31b7FZJVx8OZVoeg5SdGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD77F807B5;
	Tue,  7 May 2019 23:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CED3F89671; Tue,  7 May 2019 23:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2908F807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 23:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2908F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HWnloX5e"
Received: by mail-pl1-x641.google.com with SMTP id n8so8828497plp.10
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T8iPOh43LeF/Se1Y76x73AwSuweJCr7k4OGy4sOIQEw=;
 b=HWnloX5ezxx1+FCdhKHjIgkqobYpi3WYwACg2K5hiq9SrdKkWWHLiShB6IYEB+SpKB
 2jSsU9cMH80QAzcv5ZTzBNo2TyOddHfuWc+okSAz1zq3oq0b1OBiqXOJ2dfuEFEQoYZF
 64Db0DQFhoMW1KjqVs6oA21JkkS/e+XEQ92s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T8iPOh43LeF/Se1Y76x73AwSuweJCr7k4OGy4sOIQEw=;
 b=CrqJgzyS4IMPmR8tAE7Ns9lUQbrDWBctKDam2CXbEwnWg8PceeTiwcRMtXrOnmyCj9
 QEoVZ0RUExJYobgfBUeSMI3403oKrt8i4wcg0hpXuS047N+sBu1NOKRUcy+uUWMowjdy
 Q93EMNRoTH0yUBrdifu1TKIJaoBAN9c8RiY81hfWuKN+TGmBwVdpideZz3uU21FIGEKH
 YJQA3cYYuxcbfquG4oPK8hIaTOpxNi5olKfloJ+CDdtSCyM6sTZFfyhglpbKgHGDWzCr
 5x5oTZq8neyhHgC+/eqH98QMLmGw8z+bwCBrerhoImpkqGv1vrQHD6dg82mcocapCQGr
 HMKw==
X-Gm-Message-State: APjAAAWzl/ik6PH1BzGx6Lbm2/StEjdTKk3aKPuM/aG+EvhImd430i71
 vYrzXSIh8vsyzZG8T21DupSe/g==
X-Google-Smtp-Source: APXvYqymdg/V3cUAtSSzvdjSrSl09Rw6XIzWsSApCyPQBtsTfbAja4SLC0nfRvUkdcksymC3eMeAGA==
X-Received: by 2002:a17:902:7047:: with SMTP id
 h7mr43645697plt.177.1557266061649; 
 Tue, 07 May 2019 14:54:21 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id 19sm36854191pfs.104.2019.05.07.14.54.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 14:54:20 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Tue,  7 May 2019 14:53:57 -0700
Message-Id: <20190507215359.113378-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>, Jenny TC <jenny.tc@intel.com>
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: Intel: Add Cometlake PCI IDs
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


This small series adds PCI IDs for Cometlake platforms, for a
dazzling audio experience.

Changes in v2:
- Add CML-H ID 0x06c8 (Pierre-Louis)
- Add 0x06c8 for CML-H (Pierre-Louis)

Evan Green (2):
  ASoC: SOF: Add Comet Lake PCI IDs
  ASoC: Intel: Skylake: Add Cometlake PCI IDs

 sound/soc/intel/Kconfig                | 18 +++++++++++++++
 sound/soc/intel/skylake/skl-messages.c | 16 +++++++++++++
 sound/soc/intel/skylake/skl.c          | 10 ++++++++
 sound/soc/sof/intel/Kconfig            | 32 ++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c            |  8 +++++++
 5 files changed, 84 insertions(+)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
