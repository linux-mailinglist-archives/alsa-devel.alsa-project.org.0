Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE883B673A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 19:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A50168F;
	Mon, 28 Jun 2021 19:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A50168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624899867;
	bh=WEZnA+3XCW/FECUHlUspodkTrEkWL+56M4zxCNWa6lk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALkTc17C9mNmES1+xBuch8edfu/JF3HI63Yns7lOEllAm2yB3qZwQHvJL4ZEBnuvc
	 eHV6qOZBb9M5i7TpZ6nyr2uXfFSJHp+otdt0CvuzoqsnG0WU7HXq1TI3+SAInNElOf
	 /FcKIKFnFgtQ+bRu1vfge8iVEe/d7Lrjn5bKB+Z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCB31F802C8;
	Mon, 28 Jun 2021 19:02:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D0CF802C8; Mon, 28 Jun 2021 19:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6785CF8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 19:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6785CF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BAOBs+Hr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29DE561990;
 Mon, 28 Jun 2021 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899759;
 bh=WEZnA+3XCW/FECUHlUspodkTrEkWL+56M4zxCNWa6lk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BAOBs+Hr92V77qJeK9VYyFqHWipzZFClq204vRIeHjJ2DCmrkSaugPB+8G8CW22xr
 nDvCfh8FSOMbGp4cPlavf+x4Ndr6zZubhXoYwOFAtThiPssuqiQj/JAvUFPXoGcNG9
 hhxxV7Gu9cZIahmNNyhecrfBSc+WLAozlMkNZEHCC76J4irb5l/rBW3bfAed0JKxBl
 8NdNtabtG4WWK1neJxGx+TqkB2Y0U2rHy7Gft4CyYw1toWZ8ipbiiiNm6G0FCBocNU
 WO4JZe1K7cZ30z77eRGCWxipOX09t686BBrWdXXBC8hRKXu6itJAzc+bE6LO7MHUaK
 DA805QHMXVdNQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: remove zte zx dangling kconfig
Date: Mon, 28 Jun 2021 18:02:01 +0100
Message-Id: <162489923151.4847.4355241584790378152.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210627105955.3410015-1-pbrobinson@gmail.com>
References: <20210627105955.3410015-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
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

On Sun, 27 Jun 2021 11:59:55 +0100, Peter Robinson wrote:
> In commit dc98f1d we removed the zte zx sound drivers but there
> was a dangling Kconfig left around for the codec so fix this.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: remove zte zx dangling kconfig
      commit: 0c4f8fd3ed9cb27228497f0ae495ea6cef7017b1

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
