Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58B32954E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:42:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8707168C;
	Tue,  2 Mar 2021 00:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8707168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642152;
	bh=28PSYfVeF57DvsZcXGY6zlGtpZIWGXB1L1bS+VG83Z4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VSNMM7UL/hfrrPbg+iv9RfzbZH3X7gCV2VlNUVt/hkLtU2coq0TG7oJjYhS7N6wxe
	 0nl6yVDgFaNRjH8jGy0rdwsBS7IbVmbIIETbzrZKsaQVwC4nRp7LNSBBnyaNKt6RdD
	 43ar1e4gvoo/1n6/O4kK5fLGhPpDR9rz+U3ux6ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E03EF8027D;
	Tue,  2 Mar 2021 00:37:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43E63F80257; Tue,  2 Mar 2021 00:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A25F80257
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A25F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Iwjzg/nR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47884614A7;
 Mon,  1 Mar 2021 23:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641817;
 bh=28PSYfVeF57DvsZcXGY6zlGtpZIWGXB1L1bS+VG83Z4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Iwjzg/nRppgDfsKEyWpsIfNRGS/jeObi6GUIoIvie2mcMBpNGzENPvT7qFrdyuAcy
 F4dIP04DdqiJjqLTPgeBxd8Y8y/xNBrivQnEpIE7t9XRyVFeuj/QO+FGejsqtGDPXH
 RUnCFUkfEl/0mosmoLYiOmh+2B1EgK+Gx5rJSKOM5BwLcV8AUA80VE1C8azXCOhYqh
 dKPSSZiw5p1itWIj/jslebz34U6y4J6XI1vhHkgZVt0jw0/iNmCuAmEsibpMuu121u
 ouPWftEy+0RBIp1Ckwr6ZdMJYaYw6i8tWOcdVDiv1nC1htla5xKOhMWkUSnJFygn+i
 8CmRSlNJK1roQ==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210224141541.3331254-1-kai.vehmanen@linux.intel.com>
References: <20210224141541.3331254-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: turn off display power in resume
Message-Id: <161464168096.31144.8689550547069056031.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 daniel.baluta@nxp.com
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

On Wed, 24 Feb 2021 16:15:41 +0200, Kai Vehmanen wrote:
> Turn off display power at the end of controller resume flow. This is now
> possible with the changes done in commit 87fc20e4a0cb ("ASoC: SOF:
> Intel: hda: use hdac_ext fine-grained link management"). As codec driver
> is able to request the HDA link to be brought back up, the controller
> no longer needs to blindly keep display power enabled.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: turn off display power in resume
      commit: b0fd1b9bd056dfa0e188b44f92efe5f39ac33882

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
