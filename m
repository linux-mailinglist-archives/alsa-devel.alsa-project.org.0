Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD362F93CA
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD298173C;
	Sun, 17 Jan 2021 17:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD298173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610899681;
	bh=EacE5bdGI/vbbNWrSb4UQ45b4SwS399pIa9ugtyLzeM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CZy2gDlC+ZMecYh40cBuqp2BNn/MKv6g/KuyM/OMpsSId5pNX+Y0OMq4K26pGqkU1
	 AWD64IAX3S3BnFki6PaZFfRn+UjGmxPP6LnhOls0krL5wRIOAfAAByrOVb8HWXWRV3
	 A08i9HHwiR6D3eqm4Tg8t4So9SoGSQqRn+do6Unw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0646F80273;
	Sun, 17 Jan 2021 17:06:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678A4F80272; Sun, 17 Jan 2021 17:06:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E4CF80115
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E4CF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dthuttGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610899567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EacE5bdGI/vbbNWrSb4UQ45b4SwS399pIa9ugtyLzeM=;
 b=dthuttGAb0bzPqc3iNrIOQFh90krlS0xMs6W8ljkH+ikwangPxn20bvr64zZUH/VF/veUU
 5WHh07SOYI1svRZTFMZLTBo7UGPBw2JsTjEkyb4Xt9P+huL2NzlZYVs3Ucq9vEX9kzDhJ8
 MpKEEhrYgSZNorSTobFsIdURG8CBCsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346--1sE0xg1NIOtO_06jpFaFA-1; Sun, 17 Jan 2021 11:06:03 -0500
X-MC-Unique: -1sE0xg1NIOtO_06jpFaFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14669806666;
 Sun, 17 Jan 2021 16:06:01 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 058965C233;
 Sun, 17 Jan 2021 16:05:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 00/12] MFD/extcon/ASoC: Rework arizona codec jack-detect
 support
Date: Sun, 17 Jan 2021 17:05:43 +0100
Message-Id: <20210117160555.78376-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi All,

This series reworks the arizona codec jack-detect support to use
the snd_soc_jack helpers instead of direct extcon reporting.

This is done by reworking the extcon driver into an arizona-jackdet
library and then modifying the codec drivers to use that directly,
replacing the old separate extcon child-devices and extcon-driver.

This brings the arizona-codec jack-detect handling inline with how
all other ASoC codec driver do this.

This was developed and tested on a Lenovo Yoga Tablet 1051L with
a WM5102 codec.

The MFD, ASoC and extcon parts can be merged independent from each-other
although that could lead to a case where both the extcon driver and
the new arizona-jackdet library will try to do jack-detection. If we
end up with a git tree in that state then one of the 2 will fail to
load because the other will already have claimed the IRQs, so this
is not a problem really.

Or the entire series could be merged through the MFD tree if people
prefer that.

Note that this series also paves the way for some further cleanups,
removing some jackdetect related variables like hp_ena and hp_clamp
from the arizona data struct shared between all the MFD child devices.
I've deliberately not done that cleanup as part of this patch-series,
since IMHO the series is big enough as is. These cleanups can be done
in a follow-up series once this series has landed.

Regards,

Hans

