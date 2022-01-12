Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE948C687
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 15:53:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BD71B23;
	Wed, 12 Jan 2022 15:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BD71B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641999197;
	bh=4bXOYi2po9ChxQikcMSbKftEl0oPCwWdt//SzZM/Brw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mwP5NTtjwW3DbC0IpdFTesPQys9uVUFnfZLtRM0KTkBZtRuPCsVGLVPuoQg3/s6ul
	 OwLPGu7D4USXBjS9xsQ7YzlaLUFh3H+kb3rYx3SAGzQxkfT3/+VfFC1XDQFvr67+ot
	 7IO9OtA7uGDPj8mvwggUEirMQ7USiIr///rBrtTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6A4F8026D;
	Wed, 12 Jan 2022 15:52:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A4CF8026A; Wed, 12 Jan 2022 15:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CE5F80054
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 15:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CE5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bktxcMZc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 499CD60EBB;
 Wed, 12 Jan 2022 14:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F211DC36AEB;
 Wed, 12 Jan 2022 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641999118;
 bh=4bXOYi2po9ChxQikcMSbKftEl0oPCwWdt//SzZM/Brw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bktxcMZcoQjM+6sw7PsLJyfpBB6iEo022Top+h/Wvin1+LF15ONBAlSiBfs/8+KEL
 kN3VyFrj5kSboT9tI3xORdj5YVkWkzjar9TmOQ6iFc5EwWR1fgGRVj3v3FlYaek74V
 SVJCcDXRPeUT3gOeXOQgCHGDSgIurJxZR8oX3uPk0k8De6CmAcj8akcPhzXZoK9qsb
 kKZGDp8wBO5WA73L50UlI83SqmWyy1o35htrig8E92ZYZdIs6DNsSTRUEuROZ1s9cJ
 LgQMq2hCFm/Oq0jwL5JGlkTeMRfrg8vAyfl0Fwxrvl1VFBOnhBBJf3PhZRC57ZvSU9
 f++9RPv3KzT+A==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, pavel@ucw.cz, sre@kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, lgirdwood@gmail.com, tony@atomide.com,
 tiwai@suse.com
In-Reply-To: <20220111025048.524134-1-jiasheng@iscas.ac.cn>
References: <20220111025048.524134-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: cpcap: Check for NULL pointer after calling
 of_get_child_by_name
Message-Id: <164199911671.1042212.15547958448190798911.b4-ty@kernel.org>
Date: Wed, 12 Jan 2022 14:51:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 11 Jan 2022 10:50:48 +0800, Jiasheng Jiang wrote:
> If the device does not exist, of_get_child_by_name() will return NULL
> pointer.
> And devm_snd_soc_register_component() does not check it.
> Also, I have noticed that cpcap_codec_driver has not been used yet.
> Therefore, it should be better to check it in order to avoid the future
> dereference of the NULL pointer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: cpcap: Check for NULL pointer after calling of_get_child_by_name
      commit: f7a6021aaf02088870559f82fc13c58cda7fea1a

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
