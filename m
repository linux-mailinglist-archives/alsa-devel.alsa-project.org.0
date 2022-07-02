Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E813563FB4
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jul 2022 13:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CBA3169F;
	Sat,  2 Jul 2022 13:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CBA3169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656760167;
	bh=GXTCFNGJ/qi6q84KgPXHTPGckjOATtaMykjkvdiZ8ns=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GdnQQ/szJ1fiR+Mg9BFgLWZZE2+MAK7eS/X7H6nDHQuVFt9kMbXfoW7IzZckX/5Mz
	 Wa8Nd8Atjp8N7OPFw9EJe54BZN8cybS52r0qCnqWdXxTHvRROZ+vShnIYQQ4pwtNRt
	 iQNwlK0eukVLpwESasRpXPaSswrn8s/ihKFWU9BU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E66EF80107;
	Sat,  2 Jul 2022 13:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B62DF8032D; Sat,  2 Jul 2022 13:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9981BF8019B
 for <alsa-devel@alsa-project.org>; Sat,  2 Jul 2022 13:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9981BF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DrrTnbY+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC0E560DCC;
 Sat,  2 Jul 2022 11:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E09AC341D9;
 Sat,  2 Jul 2022 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656760068;
 bh=GXTCFNGJ/qi6q84KgPXHTPGckjOATtaMykjkvdiZ8ns=;
 h=From:To:Cc:Subject:Date:From;
 b=DrrTnbY+g/95s2OoeUYPgsUS7r9KhEaNN9bCC94hZDu/RhdENgPzZoSE1bFGIeu8f
 A7Y7GS2fdeuCvgSTgrN/C3Xk/UA4AOOR8PKrhHb1bqaCJDPjmbmDyW0ool3TYK7/Hd
 CxINUJxSqKohLK3IuucJQULpCltifiDOZOyZyfbIOGyhrjN6eL4nHdwjPVWdsBmNQr
 m10KGXrSflXIA+909EoSQweUfDbpYP0KDii/iawMcZOW08nSgdAA6iekKm5+xmvGOt
 qZOWRpYYA6Df/o1E/Rs8oS6M9Sd+dj4RU3q++vdjNLnLFq1bzTTJ2BD2bq9KC1xlYu
 xlTWaJKAO8emw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o7ayX-007gro-J8;
 Sat, 02 Jul 2022 12:07:45 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/12] Fix several documentation build warnings with Sphinx
 2.4.4
Date: Sat,  2 Jul 2022 12:07:32 +0100
Message-Id: <cover.1656759988.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 Brendan Higgins <brendanhiggins@google.com>, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-kselftest@vger.kernel.org,
 Alasdair Kergon <agk@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 kunit-dev@googlegroups.com, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Eric Dumazet <edumazet@google.com>,
 Dipen Patel <dipenp@nvidia.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
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

This series is against next-20220701. It fixes several warnings
that are currently produced while building html docs.

Each patch in this series is independent from the others, as
each one touches a different file.

Mauro Carvalho Chehab (12):
  docs: ext4: blockmap.rst: fix a broken table
  docs: tegra194-hte.rst: don't include gpiolib.c twice
  docs: device-mapper: add a blank line at writecache.rst
  docs: PCI: pci-vntb-function.rst: Properly include ascii artwork
  docs: PCI: pci-vntb-howto.rst: fix a title markup
  docs: virt: kvm: fix a title markup at api.rst
  docs: ABI: sysfs-bus-nvdimm
  kunit: test.h: fix a kernel-doc markup
  net: mac80211: fix a kernel-doc markup
  docs: alsa: alsa-driver-api.rst: remove a kernel-doc file
  docs: arm: index.rst: add google/chromebook-boot-flow
  docs: leds: index.rst: add leds-qcom-lpg to it

 Documentation/ABI/testing/sysfs-bus-nvdimm             | 2 ++
 Documentation/PCI/endpoint/pci-vntb-function.rst       | 2 +-
 Documentation/PCI/endpoint/pci-vntb-howto.rst          | 2 +-
 Documentation/admin-guide/device-mapper/writecache.rst | 1 +
 Documentation/arm/index.rst                            | 2 ++
 Documentation/driver-api/hte/tegra194-hte.rst          | 3 +--
 Documentation/filesystems/ext4/blockmap.rst            | 2 +-
 Documentation/leds/index.rst                           | 1 +
 Documentation/sound/kernel-api/alsa-driver-api.rst     | 1 -
 Documentation/virt/kvm/api.rst                         | 6 +++---
 include/kunit/test.h                                   | 2 +-
 include/net/mac80211.h                                 | 2 +-
 12 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.36.1


