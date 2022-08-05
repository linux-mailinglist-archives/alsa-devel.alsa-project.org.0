Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9FA58AB85
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 15:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496E2164F;
	Fri,  5 Aug 2022 15:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496E2164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659705731;
	bh=7o0cimbLP3DJS7c5Umhmno/pUUb9ozfJhSgiKERWHro=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyHdAw92tvxkij7v2EdgtOhd0UpHT+M9Rq1Wn17Mq0P+ZhaFUYFZHQuynqYfKgVO1
	 86fZO44cWvS6snXB5KVuYaf2jsJIJ/JgYVk3PB0j3Za4wFoQdUJnn0oW/tSglMQkXa
	 stocoV140Zm9oob7jzjH6Npk9anOmDi8Sfng3HAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2BFDF804C3;
	Fri,  5 Aug 2022 15:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F12E6F804C3; Fri,  5 Aug 2022 15:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10507F80271;
 Fri,  5 Aug 2022 15:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10507F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tt+nhnFl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEC0AB828C7;
 Fri,  5 Aug 2022 13:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604DFC433D6;
 Fri,  5 Aug 2022 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659705641;
 bh=7o0cimbLP3DJS7c5Umhmno/pUUb9ozfJhSgiKERWHro=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tt+nhnFlh2QFxFGozPuvdwChO9Ntax26GqVD95O3wn8CyLKYUhwNQHkNdVWPDhD0M
 DLUFMJxnnIaibJLdSluPkjGKGcvZqv/Dc7sUIMrGaWjqnHdm6axXoHg2WmkJzPqFlm
 IroVnsmDBBLmd3enUabDGy8HIzHNd5owuKu1Gby9oCxLIFvACvmqoWVY94YLGNzw3/
 KS450dhodWffuTU6fbZVAADR6wv0a/aKdiZy1fhRxgfqRWPoghrVX3sJ9YhzZ4j5Kt
 Yu138wBlQT52g6pABCceoXDEi/TD10sye62BG84P7RZ4un2HsW8onq7l1byVSJiTEt
 mZOalj+4N/gmA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Justin Stitt <justinstitt@google.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220803204442.2996580-1-justinstitt@google.com>
References: <20220803204442.2996580-1-justinstitt@google.com>
Subject: Re: [PATCH resend] ASoC: SOF: ipc3-topology: Fix clang -Wformat
 warning
Message-Id: <165970563810.1032419.6494155990235554892.b4-ty@kernel.org>
Date: Fri, 05 Aug 2022 14:20:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Tom Rix <trix@redhat.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Wed, 3 Aug 2022 13:44:42 -0700, Justin Stitt wrote:
> When building with Clang we encounter these warnings:
> | sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
> | 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
> |                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
> |                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~
> 
> Use correct format specifier `%d` since args are of type int.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Fix clang -Wformat warning
      commit: b7bf23c0865faac61564425ddc96a4a79ebf19b0

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
