Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313D32C51A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 01:58:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D621ABF;
	Thu,  4 Mar 2021 01:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D621ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819497;
	bh=Gi6vhMe8s4084Sx6ogEUyxF4ntiCV9nXuhbQndE8JA0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyQy8+nYE+wpNQtG3PEuH2nSrRjtaXpMuAPDcfdAjEAFl+usCRpRA/hAucBa4wjyS
	 e70gJ7bdmAu6YUj+T5dSmF9YxtGEGvFbdULeAWewrwUwEn5jE06grWQVEY4U2MG5sr
	 1mG4j4HOiqDZarWqVjrmLwf4MkDZdOdRa2x6kiiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B661EF804AA;
	Thu,  4 Mar 2021 01:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34C04F804A9; Thu,  4 Mar 2021 01:55:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97A8F80475
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97A8F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C6vnEpZ1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0C5A64E7C;
 Thu,  4 Mar 2021 00:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819332;
 bh=Gi6vhMe8s4084Sx6ogEUyxF4ntiCV9nXuhbQndE8JA0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C6vnEpZ19JwRCAzWip52gIqd1mm7MtMDD+mHEeA+XWwyfO/rgR3+pxVMc2mi1O4cJ
 0KWSvOfgmSr8GaD5rfGhhP/AKD531krvaPdXPmWCtJBjukcO9XEPwKcbW9V0KYvsfI
 0YrOzex6MC0AYk0x0gABQLVnvZbWu8VlX5dFkU2gDhQRrbz8Rp5nBrhs+K1vh32qf1
 FvNXOJHL3OX7n4h9n64b747jtk90fEN0WiGm2U+m5WCSB/m2ojFxqgROlt4eWNV+tg
 7HYl73Zw8nij+UPtlnyBIl5D9nZcJAp6k20I9gcW9PEOLOoYr5t1LyjzzyOOJqtEHd
 YWQvZFGX38JVg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
References: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/24] ASoC: realtek: fix cppcheck warnings
Message-Id: <161481924070.9553.15132742876390019419.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Shuming Fan <shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Jack Yu <jack.yu@realtek.com>
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

On Tue, 2 Mar 2021 15:25:03 -0600, Pierre-Louis Bossart wrote:
> Lots of trivial issues that make cppcheck too verbose. There shouldn't
> be any functionality change with this patchset.
> 
> Pierre-Louis Bossart (24):
>   ASoC: rt1011: use logical OR
>   ASoC: rt1011: remove redundant test
>   ASoC: rt1011: clarify expression
>   ASoC: rt1015: clarify expression
>   ASoC: rt1016: clarify expression
>   ASoC: rt1305: clarify expression
>   ASoC: rt1308: clarify expression
>   ASoC: rt5640: clarify expression
>   ASoC: rt5645: use logical OR
>   ASoC: rt5645: clarify expression
>   ASoC: rt5651: clarify expression
>   ASoC: rt5651: remove useless assignment
>   ASoC: rt5659: clarify expression
>   ASoC: rt5660: clarify expression
>   ASoC: rt5663: clarify expression
>   ASoC: rt5665: clarify expression
>   ASoC: rt5668: clarify expression
>   ASoC: rt5668: remove useless assignments
>   ASoC: rt5670: clarify expression
>   ASoC: rt5677: clarify expression
>   ASoC: rt5677: remove useless assignment
>   ASoC: rt5682: clarify expression
>   ASoC: rt5682: remove useless assignments
>   ASoC: rt5682: remove useless initialization
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/24] ASoC: rt1011: use logical OR
        commit: 5acc964734db7ec5b2d8d1dd22cee32594a551f3
[02/24] ASoC: rt1011: remove redundant test
        commit: c573fca0fac3f5eca28a0780ab5ecbb1deacb386
[03/24] ASoC: rt1011: clarify expression
        commit: 068bde16c9d1fdf2ae2fd62ce3fba536eaea623d
[04/24] ASoC: rt1015: clarify expression
        commit: 2f76b7f704f2155a2da2a8d0f7d5253e12c6fdf5
[05/24] ASoC: rt1016: clarify expression
        commit: 175a02a87b5a938bb664ceae33121bfeba2b45c1
[06/24] ASoC: rt1305: clarify expression
        commit: 25d4b3c27916a0d723e2cdc1550f239869eefdf4
[07/24] ASoC: rt1308: clarify expression
        commit: 2e0c5a4fdb83bb8d816edb6c12948e95f13cb741
[08/24] ASoC: rt5640: clarify expression
        commit: 88704a9c9b6d7ee7ec3018fd248130ce46acfc38
[09/24] ASoC: rt5645: use logical OR
        commit: 8fb4c29534f45c2bc34881960453ff133bcedb36
[10/24] ASoC: rt5645: clarify expression
        commit: 1a96045422465d1edb75bc80292294d73e29fa4b
[11/24] ASoC: rt5651: clarify expression
        commit: 5906d0c64ddc090b7fa7f26b72ca133b803fb1e4
[12/24] ASoC: rt5651: remove useless assignment
        commit: 0b6fe4729dfb39920fefac41d752b48914ee901e
[13/24] ASoC: rt5659: clarify expression
        commit: 54ae982a9fd4dc2d18cdc45201b92b02a08fcc27
[14/24] ASoC: rt5660: clarify expression
        commit: 4b5fdec4f702ce626025f7820b618c5e6915141a
[15/24] ASoC: rt5663: clarify expression
        commit: 7fe6b7ffe542055107dcc5f3d70dd5877ce86ae0
[16/24] ASoC: rt5665: clarify expression
        commit: ef138bbc4eb001898437e4c4f93d5b6076c63fba
[17/24] ASoC: rt5668: clarify expression
        commit: c7c2a964c73e3e4b571da7b8e185fbf9e054bc3d
[18/24] ASoC: rt5668: remove useless assignments
        commit: 9fe9e3733061d9e1037048e7a73d35860506c447
[19/24] ASoC: rt5670: clarify expression
        commit: 78d61c46ac12ce112682b9848bb50b7e0105962a
[20/24] ASoC: rt5677: clarify expression
        commit: 71205f24bf7906a104c118d339e91d3bc3d49b89
[21/24] ASoC: rt5677: remove useless assignment
        commit: aeaf814964282da53696c1ece267f9d27aff025a
[22/24] ASoC: rt5682: clarify expression
        commit: 3398dfd4984a7d164d913124976f85cdb197de90
[23/24] ASoC: rt5682: remove useless assignments
        commit: df665ec288c78884ce8f1dbe5e90805c919e4cdf
[24/24] ASoC: rt5682: remove useless initialization
        commit: 175fb03e241919cd1bad3d599bf306ae8eb66f23

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
