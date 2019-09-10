Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A334AE76E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 11:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC4D1671;
	Tue, 10 Sep 2019 11:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC4D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568109538;
	bh=3/UAD6RcPefevYvxTDISQB4HUtTgFuvNvxQjEQxAJXQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kABa0PsJ+RvYgeNqLGSLpSm4zzNE082JfZYXAMQIvBFtPmGRLctVTj0W/oQDZFnMb
	 jNTQ3eV7O1QwEk819lYPbesGKuixz5eL3H/boIdUTwMXbfbwcJFq/wXbsG7IAdsm1E
	 oOOm4iJEp35Hi5+A4tKwf9WFoj0fKRPjtC1mfe0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA10CF8036F;
	Tue, 10 Sep 2019 11:57:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 757A6F80368; Tue, 10 Sep 2019 11:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DE98F800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 11:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE98F800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ot9l9FRv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gm9W1pqRwTTSgXVdT7X4X15cHteQH11z2rRoMMImrgc=; b=ot9l9FRv/MSuncajLtWVA+m8t
 VNhc1zf998snmxjcaPknwcBGhkbnr2cxfHdZvx3XBIiZo5AHz7iQJ0Axnp0GdmEwJplsBEsuMWYv5
 obj+a/79eXf9J4B41C2Qa+nfwA0cifgAAZSzmJtUMU0HUqdtKas50CJG+/V8aQdNHeqmU=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7ctU-0006he-H9; Tue, 10 Sep 2019 09:57:04 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 9C7EDD02D5A; Tue, 10 Sep 2019 10:57:03 +0100 (BST)
Date: Tue, 10 Sep 2019 10:57:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190910095703.GL2036@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC updates v5.4
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
Content-Type: multipart/mixed; boundary="===============2889193049872454511=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2889193049872454511==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdEQJo40s7ofW8iR"
Content-Disposition: inline


--sdEQJo40s7ofW8iR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit f74c2bb98776e2de508f4d607cd519873065118e:

  Linux 5.3-rc8 (2019-09-08 13:33:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git asoc-v5=
=2E4

for you to fetch changes up to bb831786117519fc16dfd3eaa7b84e4f6bbb8d99:

  Merge branch 'asoc-5.4' into asoc-next (2019-09-09 14:55:20 +0100)

----------------------------------------------------------------
ASoC: Updates for v5.4

Quite a big update this time around, particularly in the core
where we've had a lot of cleanups from Morimoto-san - there's
not much functional change but quite a bit of modernization
going on.  We've also seen a lot of driver work, a lot of it
cleanups but also some particular drivers.

 - Lots and lots of cleanups from Morimoto-san and Yue Haibing.
 - Lots of cleanups and enhancements to the Freescale, sunxi dnd
   Intel rivers.
 - Initial Sound Open Firmware suppot for i.MX8.
 - Removal of w90x900 and nuc900 drivers as the platforms are
   being removed.
 - New support for Cirrus Logic CS47L15 and CS47L92, Freescale
   i.MX 7ULP and 8MQ, Meson G12A and NXP UDA1334

----------------------------------------------------------------
Amadeusz S=C5=82awi=C5=84ski (9):
      ASoC: Intel: Skylake: Combine snd_soc_skl_ipc and snd_soc_skl
      ASoC: Intel: Skylake: Do not disable FW notifications
      ASoC: Intel: Skylake: Remove static table index when parsing topology
      ASoC: Intel: Skylake: Use correct function to access iomem space
      ASoC: Intel: Fix use of potentially uninitialized variable
      ASoC: dapm: Expose snd_soc_dapm_new_control_unlocked properly
      ASoC: Intel: NHLT: Fix debug print format
      ASoC: Intel: Skylake: Print module type instead of id
      ASoC: Intel: Skylake: Release topology when we are done with it

Andra Danciu (2):
      dt-bindings: sound: Add bindings for UDA1334 codec
      ASoC: codecs: Add uda1334 codec driver

Andy Shevchenko (1):
      ASoC: Intel: Skylake: Print constant literals from format specifier

Arnd Bergmann (1):
      ASoC: remove w90x900/nuc900 platform drivers

Bard liao (1):
      ASoC: SOF: rename SOUNDWIRE to ALH

Ben Zhang (1):
      ASoC: rt5677: keep analog power register at SND_SOC_BIAS_OFF

Bjorn Andersson (1):
      ASoC: qcom: common: Include link-name in error messages

Cezary Rojewski (13):
      ASoC: Intel: Skylake: Merge skl_sst and skl into skl_dev struct
      ASoC: Intel: Skylake: Remove MCPS available check
      ASoC: Intel: Skylake: Remove memory available check
      ASoC: Intel: Skylake: Make MCPS and CPS params obsolete
      ASoC: Intel: Skylake: Cleanup skl_module_cfg declaration
      ASoC: Intel: Update request-reply IPC model
      ASoC: Intel: Skylake: Limit large_config_get to single frame
      ASoC: Intel: Skylake: large_config_get overhaul
      ASoC: Intel: Baytrail: Fix implicit fallthrough warning
      ASoC: Intel: Haswell: Adjust machine device private context
      ASoC: Intel: haswell: Simplify device probe
      ASoC: Intel: bdw-rt5677: Simplify device probe
      ASoC: Intel: broadwell: Simplify device probe

Charles Keepax (3):
      ASoC: cs47l35: Use define for DSPCLK enable bit
      ASoC: madera: Read device tree configuration
      ASoC: wm_adsp: Allow bus error handler to be called directly

Cheng-Yi Chiang (2):
      ASoC: rockchip: rockchip_max98090: Set period size to 240
      ASoC: hdmi-codec: Add an op to set callback function for plug event

Christophe JAILLET (4):
      ASoC: pcm3168a: Fix a typo in the name of a constant
      ASoC: rt5665: Fix a typo in the name of a function
      ASoC: wm8955: Fix a typo in 'wm8995_pll_factors()' function name
      ASoC: cs4271: Fix a typo in the CS4171_NR_RATIOS

Codrin Ciubotariu (4):
      ASoC: codecs: ad193x: Use regmap_multi_reg_write() when initializing
      ASoC: mchp-i2s-mcc: Fix unprepare of GCLK
      ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controller is running
      ASoC: mchp-i2s-mcc: Fix simultaneous capture and playback in master m=
ode

Colin Ian King (6):
      ASoC: codec2codec: fix missing return of error return code
      ASoC: zx-tdm: remove redundant assignment to ts_width on error return=
 path
      ASoC: codecs: ad193x: make two arrays static const, makes object smal=
ler
      ASoC: rt1011: make array pd static const, makes object smaller
      ASoC: rt1305: make array pd static const, makes object smaller
      ASoC: rt1308: make array pd static const, makes object smaller

Curtis Malainey (3):
      ASoC: rt5677: remove superfluous set
      ASoC: rt5677: Revert remove superfluous set
      ASoC: rt5677: Remove magic number register writes

Dan Carpenter (1):
      ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check

Daniel Baluta (20):
      ASoC: SOF: Introduce snd_sof_dsp_get_bar_index ops
      ASoC: SOF: loader: Use the BAR provided by FW
      ASoC: SOF: loader: Don't ignore SRAM block types
      ASoC: dt-bindings: Introduce compatible strings for 7ULP and 8MQ
      ASoC: fsl_sai: Add registers definition for multiple datalines
      ASoC: fsl_sai: Update Tx/Rx channel enable mask
      ASoC: fsl_sai: Add support for SAI new version
      ASoC: fsl_sai: Add support for imx7ulp/imx8mq
      ASoC: SOF: Remove call to snd_sof_dsp_mailbox_init
      ASoC: SOF: Intel: bdw: Use generic function for fw ready / mem window=
s creation
      ASoC: SOF: Intel: hda: Use generic function for fw ready / mem window=
s creation
      ASoC: SOF: Introduce snd_sof_dsp_get_mailbox_offset
      ASoC: SOF: Introduce snd_sof_dsp_get_window_offset
      ASoC: SOF: Intel: byt: Refactor fw ready / mem windows creation
      ASoC: SOF: topology: Add dummy support for i.MX8 DAIs
      ASoC: fsl_sai: Add support for imx8qm
      ASoC: dt-bindings: Introduce compatible string for imx8qm
      dt-bindings: dsp: fsl: Add DSP core binding support
      ASoC: SOF: Add OF DSP device support
      ASoC: SOF: imx: Add i.MX8 HW support

Daniel Stuart (2):
      ASoC: intel: cht_bsw_max98090_ti: Add all Chromebooks that need pmc_p=
lt_clk_0 quirk
      ASoC: intel: cht_bsw_max98090_ti: Add all Chromebooks that need pmc_p=
lt_clk_0 quirk

Enric Balletbo i Serra (1):
      ASoC: rockchip-max98090: Remove MICBIAS as supply of input pin IN34

Fred Oh (1):
      ASoC: SOF: remove unused state variable in suspend function

Greg Kroah-Hartman (3):
      ASoC: Intel: SoC: skylake: no need to check return value of debugfs_c=
reate functions
      ASoC: core: no need to check return value of debugfs_create functions
      ASoC: SOF: no need to check return value of debugfs_create functions

Guennadi Liakhovetski (1):
      ASoC: SOF: Intel: hda: add a parameter to disable MSI

Gustavo A. R. Silva (1):
      ASoC: ti: Mark expected switch fall-throughs

Hariprasad Kelam (3):
      sound: soc: codecs: mt6358: change return type of mt6358_codec_init_r=
eg
      ASoC: bcm: cygnus-pcm: Unneeded variable: "ret".
      ASoC: wcd9335: add irqflag IRQF_ONESHOT flag

Janusz Jankowski (1):
      ASoC: SOF: Intel: ssp: BCLK delay parameter

Janusz Krzysztofik (1):
      ASoC: ams-delta: Take control over audio mute GPIO pins

Jaroslav Kysela (1):
      ASoC: SOF: Makefile - fix the top-level kernel module names (add snd-=
 prefix)

Jaska Uimonen (2):
      ASoC: SOF: topology: use set_get_data in process load
      ASoC: SOF: topology: fix get control data return type and arguments

Jerome Brunet (17):
      ASoC: codec2codec: run callbacks in order
      ASoC: codec2codec: name link using stream direction
      ASoC: codec2codec: deal with params when necessary
      ASoC: meson: g12a-tohdmitx: override codec2codec params
      ASoC: create pcm for codec2codec links as well
      ASoC: codec2codec: remove ephemeral variables
      ASoC: codec2codec: fill some of the runtime stream parameters
      ASoC: meson: axg-tdm-formatter: free reset on device removal
      ASoC: meson: g12a-tohdmitx: require regmap mmio
      ASoC: meson: add sm1 compatibles
      ASoC: meson: add reset binding
      ASoC: meson: axg-frddr: expose all 8 outputs
      ASoC: meson: axg-toddr: expose all 8 inputs
      ASoC: meson: tdmin: expose all 16 inputs
      ASoC: meson: axg-frddr: add sm1 support
      ASoC: meson: axg-toddr: add sm1 support
      ASoC: meson: tdmout: add sm1 support

Jiaxin Yu (5):
      ASoC: mediatek: mt6358: add delay after dmic clock on
      ASoC: mediatek: mt8183: switch tdm pins gpio function when playback o=
n or off
      ASoC: mediatek: mt8183: fix tdm out data align issue
      ASoC: mediatek: mt8183: tdm hw support tdm out and 8ch i2s out
      ASoC: mediatek: mt8183: fix tdm out data is valid on rising edge

Joe Perches (1):
      ASoC: wcd9335: Fix misuse of GENMASK macro

Kai Vehmanen (5):
      ASoC: SOF: reset DMA state in prepare
      ASoC: SOF: use common code to send PCM_FREE IPC
      ASoC: SOF: ipc: use timeout configured at probe
      ASoC: SOF: core: increase default IPC timeouts
      ASoC: SOF: Intel: hda: reset link DMA state in prepare

Katsuhiro Suzuki (8):
      ASoC: es8316: fix headphone mixer volume table
      ASoC: es8316: fix inverted L/R of headphone mixer volume
      ASoC: es8316: add DT-bindings
      ASoC: es8316: add clock control of MCLK
      ASoC: es8316: fix redundant codes of clock
      ASoC: es8316: support fixed and variable both clock rates
      ASoC: rockchip: ignore 0Hz sysclk
      SoC: simple-card-utils: set 0Hz to sysclk when shutdown

Keyon Jie (5):
      ASoC: SOF: Intel: hda: correct ROM state mask
      ASoC: hdac_hda: fix page fault issue by removing race
      ASoC: Intel: sof-rt5682: add dmic dapm widget to support dmic PCM
      ASoC: Intel: skl-hda-dsp-generic: add dependency to dmic driver
      ASoC: Intel: skl-hda-dsp-generic: add dmic dapm widget and route

Kunihiko Hayashi (1):
      ASoC: uniphier: Fix double reset assersion when transitioning to susp=
end state

Kuninori Morimoto (101):
      ASoC: add soc-dai.c
      ASoC: soc-dai: mv soc_dai_hw_params() to soc-dai
      ASoC: soc-dai: add snd_soc_dai_hw_free()
      ASoC: soc-dai: add snd_soc_dai_startup()
      ASoC: soc-dai: add snd_soc_dai_shutdown()
      ASoC: soc-dai: add snd_soc_dai_prepare()
      ASoC: soc-dai: add snd_soc_dai_trigger()
      ASoC: soc-dai: add snd_soc_dai_bespoke_trigger()
      ASoC: soc-dai: add snd_soc_dai_delay()
      ASoC: soc-dai: add snd_soc_dai_suspend()
      ASoC: soc-dai: add snd_soc_dai_resume()
      ASoC: soc-dai: add snd_soc_dai_probe()
      ASoC: soc-dai: add snd_soc_dai_remove()
      ASoC: soc-dai: add snd_soc_dai_compress_new()
      ASoC: soc-core: use existing snd_soc_dai_digital_mute()
      ASoC: soc-dai: move snd_soc_dai_stream_valid() to soc-dai.c
      ASoC: soc-pcm: remove soc_rtdcom_ack()
      ASoC: soc-pcm: remove soc_rtdcom_copy_kernel()
      ASoC: soc-pcm: remove soc_fill_silence()
      ASoC: add soc-component.c
      ASoC: soc-component: add snd_soc_component_get/put()
      ASoC: soc-component: add snd_soc_component_open()
      ASoC: soc-component: add snd_soc_component_close()
      ASoC: soc-component: add snd_soc_component_prepare()
      ASoC: soc-component: add snd_soc_component_hw_params()
      ASoC: soc-component: add snd_soc_component_hw_free()
      ASoC: soc-component: add snd_soc_component_trigger()
      ASoC: soc-component: add snd_soc_component_suspend()
      ASoC: soc-component: add snd_soc_component_resume()
      ASoC: soc-component: add snd_soc_component_is_suspended()
      ASoC: soc-component: add snd_soc_component_probe()
      ASoC: soc-component: add snd_soc_component_remove()
      ASoC: soc-component: add snd_soc_component_of_xlate_dai_id()
      ASoC: soc-component: add snd_soc_component_of_xlate_dai_name()
      ASoC: soc-component: move snd_soc_component_seq_notifier()
      ASoC: soc-component: move snd_soc_component_stream_event()
      ASoC: soc-component: move snd_soc_component_set_bias_level()
      ASoC: soc-component: add snd_soc_pcm_component_pointer()
      ASoC: soc-component: add snd_soc_pcm_component_ioctrl()
      ASoC: soc-component: add snd_soc_pcm_component_copy_user()
      ASoC: soc-component: add snd_soc_pcm_component_page()
      ASoC: soc-component: add snd_soc_pcm_component_mmap()
      ASoC: soc-component: add snd_soc_pcm_component_pcm_new()
      ASoC: soc-component: add snd_soc_pcm_component_pcm_free()
      ASoC: rsnd: don't call clk_get_rate() under atomic context
      ASoC: soc-core: set component->debugfs_root NULL
      ASoC: soc-core: add comment for for_each_xxx
      ASoC: soc-core: check return value of snd_soc_add_dai_link()
      ASoC: soc-core: don't use for_each_card_links_safe() at snd_soc_find_=
dai_link()
      ASoC: soc-core: reuse rtdcom at snd_soc_rtdcom_add()
      ASoC: soc-core: tidyup for snd_soc_dapm_new_controls()
      ASoC: soc-core: tidyup for snd_soc_add_component_controls()
      ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()
      ASoC: soc-core: tidyup for snd_soc_add_card_controls()
      ASoC: soc-core: call snd_soc_dapm_debugfs_init() at soc_init_card_deb=
ugfs()
      ASoC: soc-core: remove unneeded list_empty() check for snd_soc_try_re=
bind_card()
      ASoC: soc-core: tidyup for card->deferred_resume_work
      ASoC: soc-core: define soc_dpcm_debugfs_add() for non CONFIG_DEBUG_FS
      ASoC: soc-core: dai_link check under soc_dpcm_debugfs_add()
      ASoC: soc-core: support snd_soc_dai_link_component for aux_dev
      ASoC: simple-card: use snd_soc_dai_link_component for aux_dev
      ASoC: intel: cht_bsw_max98090_ti: use snd_soc_dai_link_component for =
aux_dev
      ASoC: mediatek: mt8183-da7219-max98357: use snd_soc_dai_link_componen=
t for aux_dev
      ASoC: meson: axg-card: use snd_soc_dai_link_component for aux_dev
      ASoC: rockchip: rockchip_max98090: use snd_soc_dai_link_component for=
 aux_dev
      ASoC: samsung: neo1973_wm8753: use snd_soc_dai_link_component for aux=
_dev
      ASoC: samsung: speyside: use snd_soc_dai_link_component for aux_dev
      ASoC: samsung: tm2_wm5110: use snd_soc_dai_link_component for aux_dev
      ASoC: sunxi: sun4i-codec: use snd_soc_dai_link_component for aux_dev
      ASoC: ti: rx51: use snd_soc_dai_link_component for aux_dev
      ASoC: soc-core: remove legacy style of aux_dev
      ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: use snd_soc_dai_link_=
component for aux_dev
      ASoC: soc-core: add for_each_xxx macro for aux_dev
      ASoC: soc-core: merge snd_soc_initialize_card_lists()
      ASoC: soc-core: remove unneeded dai_link check from snd_soc_remove_da=
i_link()
      ASoC: soc-core: use device_register()
      ASoC: soc-core: add NOTE to snd_soc_rtdcom_lookup()
      ASoC: soc-core: soc_cleanup_card_resources() become void
      ASoC: soc-dai: use bit field for bus_control
      ASoC: soc-topology: use for_each_component_dais() at remove_dai()
      ASoC: soc-core: initialize component list
      ASoC: soc-core: initialize list at one place
      ASoC: soc-core: rename soc_post_component_init() to soc_rtd_init()
      ASoC: soc-core: add soc_rtd_free()
      ASoC: soc-core: move soc_probe_component() position
      ASoC: soc-core: dapm related setup at one place
      ASoC: soc-core: add snd_soc_dapm_init()
      ASoC: soc-core: move soc_probe_link_components() position
      ASoC: simple-card: indicate rebind issue
      ASoC: audio-graph: indicate rebind issue
      ASoC: soc-core: add comment to jack at soc_remove_component()
      ASoC: soc-core: self contained soc_probe_link_components()
      ASoC: soc-core: self contained soc_remove_link_components()
      ASoC: soc-core: self contained soc_remove_link_dais()
      ASoC: soc-core: move soc_probe_dai() next to soc_remove_dai()
      ASoC: soc-core: add new soc_link_init()
      ASoC: soc-core: self contained soc_probe_link_dais()
      ASoC: soc-core: move soc_probe_link_dais() next to soc_remove_link_da=
is()
      ASoC: soc-core: self contained soc_bind_aux_dev()
      ASoC: soc-core: add soc_unbind_aux_dev()
      ASoC: soc-core: self contained soc_unbind_aux_dev()

Libin Yang (1):
      ASoC: intel: skl_hda_dsp_common: create HDMI jack kctl

Lucas Stach (4):
      ASoC: fsl_sai: add of_match data
      ASoC: fsl_sai: derive TX FIFO watermark from FIFO depth
      ASoC: fsl_sai: mark regmap as fast_io
      ASoC: tlv320aic31xx: suppress error message for EPROBE_DEFER

Mac Chiang (1):
      ASoC: Intel: boards: Add Cometlake machine driver support

Mark Brown (8):
      Merge branch 'asoc-5.3' into asoc-5.4
      Merge branch 'topic/hda-dmic' of https://git.kernel.org/.../tiwai/sou=
nd into asoc-5.4
      ASoC: sof: Fix warning when IPC flood test is not enabled
      Merge branch 'topic/hda-bus-ops-cleanup' of https://git.kernel.org/..=
=2E/tiwai/sound into asoc-5.4
      Merge branch 'topic/hda-bus-ops-cleanup' of https://git.kernel.org/..=
=2E/tiwai/sound into asoc-5.4
      Merge branch 'asoc-5.3' into asoc-5.4
      Merge branch 'asoc-5.3' into asoc-linus
      Merge branch 'asoc-5.4' into asoc-next

Masanari Iida (1):
      ASoC: ti: Fix typos in ti/Kconfig

Mauro Carvalho Chehab (1):
      ASoC: sunxi: fix a sound binding broken reference

Maxime Ripard (28):
      ASoC: sun4i-i2s: Register regmap and PCM before our component
      ASoC: sun4i-i2s: Switch to devm for PCM register
      ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK
      ASoC: sun4i-i2s: Replace call to params_channels by local variable
      ASoC: sun4i-i2s: Rework MCLK divider calculation
      ASoC: sun4i-i2s: Move the channel configuration to a callback
      ASoC: sun4i-i2s: Move the format configuration to a callback
      ASoC: sun4i-i2s: Use module clock as BCLK parent on newer SoCs
      ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs
      ASoC: sun4i-i2s: RX and TX counter registers are swapped
      ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs
      ASoC: sun4i-i2s: Fix the LRCK polarity
      ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t
      ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t
      ASoC: sun4i-i2s: Fix the LRCK period on A83t
      ASoC: sun4i-i2s: Remove duplicated quirks structure
      ASoC: sun4i-i2s: Pass the channels number as an argument
      ASoC: sun4i-i2s: Support more channels
      ASoC: sun4i-i2s: Add support for TDM slots
      ASoC: sun4i-i2s: Use the physical / slot width for the clocks
      ASoC: sun4i-i2s: Use the actual format width instead of an hardcoded =
one
      ASoC: sun4i-i2s: Replace call to params_width by local variable
      ASoC: sun4i-i2s: Add support for DSP formats
      ASoC: sunxi: Revert initial A83t support
      ASoC: sun4i: Revert A83t description
      ASoC: dt-bindings: sun4i-spdif: Fix dma-names warning
      ASoC: dt-bindings: Convert Allwinner A33 codec to a schema
      ASoC: dt-bindings: Convert Allwinner A64 analog codec to a schema

Micha=C5=82 Miros=C5=82aw (5):
      ASoC: wm8904: fix typo in DAPM kcontrol name
      ASoC: wm8904: implement input mode select as a mux
      ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig
      ASoC: atmel_ssc_dai: rework DAI format configuration
      ASoC: atmel_ssc_dai: implement left-justified data mode

Oleksandr Suvorov (6):
      ASoC: Define a set of DAPM pre/post-up events
      ASoC: sgtl5000: Improve VAG power and mute control
      ASoC: sgtl5000: Fix definition of VAG Ramp Control
      ASoC: sgtl5000: add ADC mute control
      ASoC: sgtl5000: Fix of unmute outputs on probe
      ASoC: sgtl5000: Fix charge pump source assignment

Pan Xiuli (5):
      ASoC: SOF: pci: mark last_busy value at runtime PM init
      ASoC: Intel: common: add ACPI matching tables for Tiger Lake
      ASoC: SOF: Intel: initial support for Tiger Lake.
      ASoC: Intel: common: add ACPI matching tables for EHL
      ASoC: SOF: Intel: initial support for Elkhart Lake

Peter Ujfalusi (12):
      ASoC: pcm3168a: Allow all channels in case of parallel DIN/DOUT setup
      ASoC: ti: davinci-mcasp: Add support for RIGHT_J format
      ASoC: ti: davinci-mcasp: Improve serializer handling in multi AXR set=
ups
      ASoC: ti: davinci-mcasp: Support for correct symmetric sample bits
      ASoC: pcm3168a: Retain the independence of DAC and ADC side of the co=
dec
      ASoC: pcm3168a: Allow reconfiguration of tdm_slots and slot_width
      ASoC: core: Move pcm_mutex up to card level from snd_soc_pcm_runtime
      ASoC: ti: davinci-i2s: Move the XSYNCERR workaround to .prepare callb=
ack
      ASoC: ti: davinci-i2s: Add S32_LE as support format
      ASoC: ti: edma-pcm: Fix for legacy dma_slave_map based channel lookup
      ASoC: ti: davinci-evm: Do not fail if the dai_set_sysclk returns -ENO=
TSUPP
      ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is n=
ot set

Pierre-Louis Bossart (14):
      ASoC: Intel: Skylake: move NHLT header to common directory
      ALSA: hda: move parts of NHLT code to new module
      ALSA: hda: intel-nhlt: handle NHLT VENDOR_DEFINED DMIC geometry
      ASoC: Intel: Skylake: use common NHLT module
      ALSA: hda/intel: stop probe if DMICS are detected on Skylake+ platfor=
ms
      ASoC: SOF: Intel: hda: fix MSI handling
      ASoC: soc-core: fix module_put() warning in soc_cleanup_component
      ASoC: SOF: Intel: hda: fixup HDaudio topology name with DMIC number
      ASoC: Intel: hsw: remove i386 build warning w/ size_t argument
      ASoC: SOF: fix HDA direct MMIO access
      ASoC: SOF: ipc: add ALH parameters
      ASoC: SOF: topology: initial support for Intel ALH DAI type
      ASoC: SOF: pcm: add ALH support
      ASoC: SOF/Intel: fix selection of SND_INTEL_NHTL

Rander Wang (4):
      ASoC: SOF: Intel: hda: reduce ifdef usage for hda
      ASoC: SOF: Intel: hda: Enable jack detection
      ASoC: SOF: Intel: hda: fix link DMA config
      ASoC: SOF: Intel: hda: fix stream id setting

Ranjani Sridharan (2):
      ASoC: SOF: Intel: hda: Make hdac_device device-managed
      ASoC: SOF: Intel: hda: Initialize HDA controller after i915 init

Richard Fitzgerald (1):
      ASoC: cs47l15: Add codec driver for Cirrus Logic CS47L15

Sathya Prakash M R (1):
      ASoC: Intel: boards: Match Product Family instead of product

Shengjiu Wang (8):
      ASoC: fsl_esai: Wrap some operations to be functions
      ASoC: fsl_esai: recover the channel swap after xrun
      ASoC: fsl_esai: Add compatible string for imx6ull
      ASoC: fsl_esai: Add new compatible string for imx6ull
      ASoC: imx-audmux: Add driver suspend and resume to support MEGA Fast
      ASoC: imx-audmix: register the card on a proper dev
      ASoC: cs42xx8: Force suspend/resume during system suspend/resume
      ASoC: fsl_ssi: Fix clock control issue in master mode

Shuming Fan (6):
      ASoC: rt1308: simplify the EFUSE read function
      ASoC: rt1308: add silence detection and manual PDB control
      ASoC: rt1308: Convert headers to SPDX
      ASoC: rt1011: Add R0 temperature and TDM1 ADC2DAT Swap control
      ASoC: rt1011: Add a flag for the R0 calibration test
      ASoC: rt1011: add mutex protection to set_fmt/set_tdm_slot

Srinivas Kandagatla (1):
      ASoC: wcd9335: Fix primary interpolator max rate

Stephen Boyd (1):
      ASoC: Remove dev_err() usage after platform_get_irq()

Stephen Rothwell (1):
      ALSA: hda: readl/writel need linux/io.h

Stuart Henderson (1):
      ASoC: cs47l92: Add codec driver for Cirrus Logic CS47L92

Szymon Mielczarek (1):
      ASoC: dapm: Invalidate only paths reachable for a given stream

Takashi Iwai (4):
      ALSA: hda: Remove page allocation redirection
      ALSA: hda: Direct MMIO accesses
      ASoC: SOF: Intel: Initialize hdaudio bus properly
      ASoC: hdac_hdmi: Offload dapm update at jack detection

Timo Wischer (1):
      ASoC: rsnd: Support hw_free() callback at DAI level

Tzung-Bi Shih (6):
      ASoC: mediatek: mt8183: make headset codec optional
      ASoC: mediatek: mt8183: remove unused DAPM-related variables
      ASoC: mediatek: mt8183: move private structure
      ASoC: mediatek: mt8183: move headset jack to card-specific storage
      ASoC: mediatek: mt8183: remove forward declaration of headset_init
      ASoC: mediatek: mt8183: fix space issues

Vidyakumar Athota (1):
      ALSA: pcm: add support for 352.8KHz and 384KHz sample rate

Wei Yongjun (1):
      ASoC: SOF: imx8: Fix return value check in imx8_probe()

YueHaibing (66):
      ASoC: tegra20_das: use devm_platform_ioremap_resource() to simplify c=
ode
      ASoC: tegra: use devm_platform_ioremap_resource() to simplify code
      ASoC: rockchip: use devm_platform_ioremap_resource() to simplify code
      ASoC: ep93xx-i2s: use devm_platform_ioremap_resource() to simplify co=
de
      ASoC: mt8173: use devm_platform_ioremap_resource() to simplify code
      ASoC: mt6797: use devm_platform_ioremap_resource() to simplify code
      ASoC: imx-audmux: use devm_platform_ioremap_resource() to simplify co=
de
      ASoC: fsl_audmix: use devm_platform_ioremap_resource() to simplify co=
de
      ASoC: bcm2835-i2s: use devm_platform_ioremap_resource() to simplify c=
ode
      ASoC: sirf: use devm_platform_ioremap_resource() to simplify code
      ASoC: mxs-saif: use devm_platform_ioremap_resource() to simplify code
      ASoC: spear: use devm_platform_ioremap_resource() to simplify code
      ASoC: kirkwood-i2s: use devm_platform_ioremap_resource() to simplify =
code
      ASoC: xtfpga-i2s: use devm_platform_ioremap_resource() to simplify co=
de
      ASoC: meson: axg-pdm: use devm_platform_ioremap_resource() to simplif=
y code
      ASoC: meson: axg-spdifin: use devm_platform_ioremap_resource() to sim=
plify code
      ASoC: meson: axg-spdifout: use devm_platform_ioremap_resource() to si=
mplify code
      ASoC: meson: axg-fifo: use devm_platform_ioremap_resource() to simpli=
fy code
      ASoC: xlnx: use devm_platform_ioremap_resource() to simplify code
      ASoC: sun8i-codec-analog: use devm_platform_ioremap_resource() to sim=
plify code
      ASoC: sunxi: sun50i-codec-analog: use devm_platform_ioremap_resource(=
) to simplify code
      ASoC: sun8i-codec: use devm_platform_ioremap_resource() to simplify c=
ode
      ASoC: stm32: sai: use devm_platform_ioremap_resource() to simplify co=
de
      ASoC: codecs: msm8916-wcd: use devm_platform_ioremap_resource() to si=
mplify code
      ASoC: codecs: jz4725b: use devm_platform_ioremap_resource() to simpli=
fy code
      ASoC: mmp-sspa: use devm_platform_ioremap_resource() to simplify code
      ASoC: jz4740: use devm_platform_ioremap_resource() to simplify code
      ASoC: inno_rk3036: use devm_platform_ioremap_resource() to simplify c=
ode
      ASoC: uniphier: evea: use devm_platform_ioremap_resource() to simplif=
y code
      ASoC: uniphier: aio-dma: use devm_platform_ioremap_resource() to simp=
lify code
      ASoC: psc-ac97: use devm_platform_ioremap_resource() to simplify code
      ASoC: au1x: psc-i2s: use devm_platform_ioremap_resource() to simplify=
 code
      ASoC: meson: g12a-tohdmitx: use devm_platform_ioremap_resource() to s=
implify code
      ASoC: meson: axg-tdm-formatter: use devm_platform_ioremap_resource() =
to simplify code
      ASoC: tscs454: remove unused variable 'PLL_48K_RATE'
      ASoC: SOF: Intel: Add missing include file hdac_hda.h
      ASoC: mt6351: remove unused variable 'mt_lineout_control'
      ASoC: ml26124: remove unused variable 'ngth'
      ASoC: max98926: remove two unused variables
      ASoC: max9850: remove unused variable 'max9850_reg'
      ASoC: es8328: Fix copy-paste error in es8328_right_line_controls
      ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'
      ASoC: wm8737: Fix copy-paste error in wm8737_snd_controls
      ASoC: soc-core: Fix -Wunused-const-variable warning
      ASoC: mt2701: remove unused variables
      ASoC: mediatek: mt8183-da7219-max98357: remove unused variable
      ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: remove unused variabl=
es
      ASoC: cs42l73: remove unused variables 'vsp_output_mux' and 'xsp_outp=
ut_mux'
      ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'
      ASoC: max98371: remove unused variable 'max98371_noload_gain_tlv'
      ASoC: rt1011: remove unused variable 'dac_vol_tlv' and 'adc_vol_tlv'
      ASoC: tlv320aic23: remove unused variable 'tlv320aic23_rec_src'
      ASoC: tlv320aic31xx: remove unused variable 'cm_m_enum'
      ASoC: es8328: remove unused variable 'pga_tlv'
      ASoC: es8328: Fix copy-paste error in es8328_right_line_controls
      ASoC: cs42l56: remove unused variable 'adc_swap_enum'
      ASoC: 88pm860x: remove unused variables 'pcm_switch_controls' and 'ai=
f1_mux'
      ASoC: AMD: Fix Kconfig warning without GPIOLIB
      ASoC: wm8988: fix typo in wm8988_right_line_controls
      ASoC: mediatek: mt2701: Fix -Wunused-const-variable warnings
      ASoC: SOF: imx8: Make some functions static
      ASoC: amd: use devm_platform_ioremap_resource() to simplify code
      ASoC: ep93xx: use devm_platform_ioremap_resource() to simplify code
      ASoC: sirf-audio: use devm_platform_ioremap_resource() to simplify co=
de
      ASoC: tegra: use devm_platform_ioremap_resource() to simplify code
      ASoC: SOF: imx8: Fix COMPILE_TEST error

Zhu Yingjiang (3):
      ASoC: SOF: Intel: hda: set position buffer in init chip
      ASoC: SOF: Intel: hda: use SOF defined init chip in resume
      ASoC: SOF: Intel: hda: remove duplicated clear WAKESTS

fengchunguo (1):
      ASoC: max98383: fix i2c probe failure

 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml |   88 +
 .../bindings/sound/allwinner,sun4i-a10-spdif.yaml  |    4 +-
 .../sound/allwinner,sun50i-a64-codec-analog.yaml   |   39 +
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml  |   57 +
 .../devicetree/bindings/sound/amlogic,axg-fifo.txt |    9 +-
 .../devicetree/bindings/sound/amlogic,axg-pdm.txt  |    6 +-
 .../bindings/sound/amlogic,axg-spdifin.txt         |    6 +-
 .../bindings/sound/amlogic,axg-spdifout.txt        |    6 +-
 .../bindings/sound/amlogic,axg-tdm-formatters.txt  |    4 +-
 .../bindings/sound/amlogic,g12a-tohdmitx.txt       |    5 +-
 .../devicetree/bindings/sound/everest,es8316.txt   |   23 +
 .../devicetree/bindings/sound/fsl,esai.txt         |    7 +-
 .../devicetree/bindings/sound/fsl-sai.txt          |    4 +-
 .../bindings/sound/sun50i-codec-analog.txt         |   14 -
 .../devicetree/bindings/sound/sun8i-a33-codec.txt  |   63 -
 .../devicetree/bindings/sound/uda1334.txt          |   17 +
 arch/arm/mach-omap1/board-ams-delta.c              |   10 +-
 include/sound/hdaudio.h                            |   69 +-
 include/sound/hdaudio_ext.h                        |    1 -
 include/sound/hdmi-codec.h                         |   17 +
 .../skl-nhlt.h =3D> include/sound/intel-nhlt.h       |   51 +-
 include/sound/pcm.h                                |    5 +
 include/sound/soc-acpi-intel-match.h               |    2 +
 include/sound/soc-component.h                      |  387 ++++
 include/sound/soc-dai.h                            |   28 +-
 include/sound/soc-dapm.h                           |   14 +-
 include/sound/soc-dpcm.h                           |    9 +-
 include/sound/soc.h                                |  348 +---
 include/sound/sof/dai-intel.h                      |   12 +
 include/sound/sof/dai.h                            |    5 +-
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/uapi/sound/sof/tokens.h                    |    9 +
 sound/core/pcm_native.c                            |    2 +-
 sound/hda/Kconfig                                  |    8 +
 sound/hda/Makefile                                 |    3 +
 sound/hda/ext/hdac_ext_bus.c                       |   60 +-
 sound/hda/hdac_bus.c                               |   37 +-
 sound/hda/hdac_controller.c                        |   18 +-
 sound/hda/hdac_stream.c                            |    8 +-
 sound/hda/intel-nhlt.c                             |  107 +
 sound/pci/hda/Kconfig                              |   11 +
 sound/pci/hda/hda_codec.c                          |    8 +-
 sound/pci/hda/hda_controller.c                     |    6 +-
 sound/pci/hda/hda_controller.h                     |    3 +-
 sound/pci/hda/hda_intel.c                          |  105 +-
 sound/pci/hda/hda_tegra.c                          |   84 +-
 sound/soc/Kconfig                                  |    1 -
 sound/soc/Makefile                                 |    3 +-
 sound/soc/amd/Kconfig                              |    2 +-
 sound/soc/amd/acp-pcm-dma.c                        |    3 +-
 sound/soc/atmel/Kconfig                            |   30 +-
 sound/soc/atmel/atmel-classd.c                     |    7 +-
 sound/soc/atmel/atmel-pdmic.c                      |    7 +-
 sound/soc/atmel/atmel_ssc_dai.c                    |  293 +--
 sound/soc/atmel/mchp-i2s-mcc.c                     |  111 +-
 sound/soc/au1x/psc-ac97.c                          |    5 +-
 sound/soc/au1x/psc-i2s.c                           |    5 +-
 sound/soc/bcm/bcm2835-i2s.c                        |    4 +-
 sound/soc/bcm/cygnus-pcm.c                         |    6 +-
 sound/soc/bcm/cygnus-ssp.c                         |    7 +-
 sound/soc/cirrus/ep93xx-ac97.c                     |    4 +-
 sound/soc/cirrus/ep93xx-i2s.c                      |    4 +-
 sound/soc/codecs/88pm860x-codec.c                  |   15 -
 sound/soc/codecs/Kconfig                           |   21 +
 sound/soc/codecs/Makefile                          |    6 +
 sound/soc/codecs/ad193x.c                          |   19 +-
 sound/soc/codecs/cs4271.c                          |    6 +-
 sound/soc/codecs/cs42l56.c                         |    8 -
 sound/soc/codecs/cs42l73.c                         |    6 -
 sound/soc/codecs/cs42xx8.c                         |    2 +
 sound/soc/codecs/cs4349.c                          |    1 +
 sound/soc/codecs/cs47l15.c                         | 1490 ++++++++++++++
 sound/soc/codecs/cs47l35.c                         |    2 +-
 sound/soc/codecs/cs47l90.c                         |    9 +-
 sound/soc/codecs/cs47l92.c                         | 2039 ++++++++++++++++=
++++
 sound/soc/codecs/es8316.c                          |   73 +-
 sound/soc/codecs/es8328.c                          |    3 +-
 sound/soc/codecs/hdac_hda.c                        |    4 +
 sound/soc/codecs/hdac_hdmi.c                       |   57 +-
 sound/soc/codecs/hdmi-codec.c                      |   46 +
 sound/soc/codecs/inno_rk3036.c                     |    4 +-
 sound/soc/codecs/jz4725b.c                         |    4 +-
 sound/soc/codecs/jz4740.c                          |    4 +-
 sound/soc/codecs/madera.c                          |  531 ++++-
 sound/soc/codecs/madera.h                          |   10 +
 sound/soc/codecs/max98371.c                        |    4 -
 sound/soc/codecs/max98373.c                        |   34 +-
 sound/soc/codecs/max98373.h                        |    1 +
 sound/soc/codecs/max9850.c                         |   13 -
 sound/soc/codecs/max98926.c                        |    9 -
 sound/soc/codecs/ml26124.c                         |    1 -
 sound/soc/codecs/msm8916-wcd-analog.c              |   12 +-
 sound/soc/codecs/msm8916-wcd-digital.c             |    4 +-
 sound/soc/codecs/mt6351.c                          |    5 -
 sound/soc/codecs/mt6358.c                          |   10 +-
 sound/soc/codecs/pcm3168a.c                        |  133 +-
 sound/soc/codecs/rk3328_codec.c                    |    4 +-
 sound/soc/codecs/rt1011.c                          |   56 +-
 sound/soc/codecs/rt1011.h                          |    3 +-
 sound/soc/codecs/rt1305.c                          |    3 +-
 sound/soc/codecs/rt1308.c                          |   51 +-
 sound/soc/codecs/rt1308.h                          |    6 +-
 sound/soc/codecs/rt5665.c                          |    8 +-
 sound/soc/codecs/rt5677.c                          |   20 +-
 sound/soc/codecs/sgtl5000.c                        |  248 ++-
 sound/soc/codecs/sgtl5000.h                        |    2 +-
 sound/soc/codecs/sirf-audio-codec.c                |    4 +-
 sound/soc/codecs/tlv320aic23.c                     |    2 -
 sound/soc/codecs/tlv320aic31xx.c                   |    8 +-
 sound/soc/codecs/tscs454.c                         |    1 -
 sound/soc/codecs/twl6040.c                         |    4 +-
 sound/soc/codecs/uda1334.c                         |  295 +++
 sound/soc/codecs/wcd-clsh-v2.c                     |    2 +-
 sound/soc/codecs/wcd9335.c                         |   23 +-
 sound/soc/codecs/wm8737.c                          |    2 +-
 sound/soc/codecs/wm8904.c                          |   56 +-
 sound/soc/codecs/wm8955.c                          |    4 +-
 sound/soc/codecs/wm8988.c                          |    2 +-
 sound/soc/codecs/wm_adsp.c                         |    6 +-
 sound/soc/codecs/wm_adsp.h                         |    4 +-
 sound/soc/fsl/fsl_asrc.c                           |    4 +-
 sound/soc/fsl/fsl_audmix.c                         |    4 +-
 sound/soc/fsl/fsl_esai.c                           |  267 ++-
 sound/soc/fsl/fsl_sai.c                            |  358 ++--
 sound/soc/fsl/fsl_sai.h                            |   85 +-
 sound/soc/fsl/fsl_spdif.c                          |    4 +-
 sound/soc/fsl/fsl_ssi.c                            |   22 +-
 sound/soc/fsl/imx-audmix.c                         |    4 +-
 sound/soc/fsl/imx-audmux.c                         |   58 +-
 sound/soc/fsl/imx-ssi.c                            |    4 +-
 sound/soc/generic/audio-graph-card.c               |   19 +
 sound/soc/generic/simple-card-utils.c              |    7 +
 sound/soc/generic/simple-card.c                    |   22 +-
 sound/soc/intel/Kconfig                            |    1 +
 sound/soc/intel/baytrail/sst-baytrail-ipc.c        |   65 +-
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        |    1 +
 sound/soc/intel/boards/Kconfig                     |   28 +-
 sound/soc/intel/boards/bdw-rt5677.c                |    6 +-
 sound/soc/intel/boards/broadwell.c                 |    6 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   31 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c       |  101 +-
 sound/soc/intel/boards/haswell.c                   |    6 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |    5 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    4 +
 sound/soc/intel/boards/sof_rt5682.c                |    7 +-
 sound/soc/intel/common/Makefile                    |    1 +
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |   12 +
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c  |   18 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |   24 +
 sound/soc/intel/common/soc-intel-quirks.h          |    5 +
 sound/soc/intel/common/sst-acpi.c                  |    3 +-
 sound/soc/intel/common/sst-ipc.c                   |   71 +-
 sound/soc/intel/common/sst-ipc.h                   |   28 +-
 sound/soc/intel/haswell/sst-haswell-ipc.c          |  164 +-
 sound/soc/intel/skylake/Makefile                   |   12 +-
 sound/soc/intel/skylake/bxt-sst.c                  |   50 +-
 sound/soc/intel/skylake/cnl-sst-dsp.h              |    7 +-
 sound/soc/intel/skylake/cnl-sst.c                  |   43 +-
 sound/soc/intel/skylake/skl-debug.c                |   44 +-
 sound/soc/intel/skylake/skl-messages.c             |  264 ++-
 sound/soc/intel/skylake/skl-nhlt.c                 |  109 +-
 sound/soc/intel/skylake/skl-pcm.c                  |   74 +-
 sound/soc/intel/skylake/skl-ssp-clk.c              |    5 +-
 sound/soc/intel/skylake/skl-sst-dsp.c              |   10 +-
 sound/soc/intel/skylake/skl-sst-dsp.h              |   29 +-
 sound/soc/intel/skylake/skl-sst-ipc.c              |  160 +-
 sound/soc/intel/skylake/skl-sst-ipc.h              |   55 +-
 sound/soc/intel/skylake/skl-sst-utils.c            |   37 +-
 sound/soc/intel/skylake/skl-sst.c                  |   54 +-
 sound/soc/intel/skylake/skl-topology.c             |  494 ++---
 sound/soc/intel/skylake/skl-topology.h             |   43 +-
 sound/soc/intel/skylake/skl.c                      |   73 +-
 sound/soc/intel/skylake/skl.h                      |  105 +-
 sound/soc/kirkwood/kirkwood-i2s.c                  |    8 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |    3 +-
 sound/soc/mediatek/common/mtk-btcvsd.c             |    4 +-
 sound/soc/mediatek/mt2701/mt2701-afe-common.h      |   21 -
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   38 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |    5 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    8 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |   15 +-
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c         |  177 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  150 +-
 sound/soc/mediatek/mt8183/mt8183-reg.h             |    8 +-
 sound/soc/meson/Kconfig                            |    1 +
 sound/soc/meson/axg-card.c                         |   11 +-
 sound/soc/meson/axg-fifo.c                         |    6 +-
 sound/soc/meson/axg-fifo.h                         |    1 +
 sound/soc/meson/axg-frddr.c                        |  105 +-
 sound/soc/meson/axg-pdm.c                          |    4 +-
 sound/soc/meson/axg-spdifin.c                      |    4 +-
 sound/soc/meson/axg-spdifout.c                     |    4 +-
 sound/soc/meson/axg-tdm-formatter.c                |    6 +-
 sound/soc/meson/axg-tdmin.c                        |   47 +-
 sound/soc/meson/axg-tdmout.c                       |  103 +-
 sound/soc/meson/axg-toddr.c                        |   83 +-
 sound/soc/meson/g12a-tohdmitx.c                    |   38 +-
 sound/soc/mxs/mxs-saif.c                           |   13 +-
 sound/soc/nuc900/Kconfig                           |   29 -
 sound/soc/nuc900/Makefile                          |   12 -
 sound/soc/nuc900/nuc900-ac97.c                     |  391 ----
 sound/soc/nuc900/nuc900-audio.c                    |   73 -
 sound/soc/nuc900/nuc900-audio.h                    |  108 --
 sound/soc/nuc900/nuc900-pcm.c                      |  321 ---
 sound/soc/pxa/mmp-sspa.c                           |    4 +-
 sound/soc/qcom/common.c                            |   22 +-
 sound/soc/qcom/lpass-platform.c                    |    5 +-
 sound/soc/rockchip/rockchip_i2s.c                  |    3 +
 sound/soc/rockchip/rockchip_max98090.c             |   18 +-
 sound/soc/samsung/neo1973_wm8753.c                 |    3 +-
 sound/soc/samsung/speyside.c                       |    3 +-
 sound/soc/samsung/tm2_wm5110.c                     |   10 +-
 sound/soc/sh/rcar/adg.c                            |   21 +-
 sound/soc/sh/rcar/core.c                           |   16 +-
 sound/soc/sh/rcar/rsnd.h                           |   12 +-
 sound/soc/sirf/sirf-usp.c                          |    4 +-
 sound/soc/soc-component.c                          |  561 ++++++
 sound/soc/soc-compress.c                           |   57 +-
 sound/soc/soc-core.c                               | 1269 +++++-------
 sound/soc/soc-dai.c                                |  407 ++++
 sound/soc/soc-dapm.c                               |  361 ++--
 sound/soc/soc-generic-dmaengine-pcm.c              |    6 +
 sound/soc/soc-jack.c                               |   18 -
 sound/soc/soc-pcm.c                                |  546 ++----
 sound/soc/soc-topology.c                           |    8 +-
 sound/soc/soc-utils.c                              |  199 --
 sound/soc/sof/Kconfig                              |   11 +
 sound/soc/sof/Makefile                             |    8 +-
 sound/soc/sof/core.c                               |    4 +-
 sound/soc/sof/debug.c                              |   50 +-
 sound/soc/sof/imx/Kconfig                          |   23 +
 sound/soc/sof/imx/Makefile                         |    4 +
 sound/soc/sof/imx/imx8.c                           |  394 ++++
 sound/soc/sof/intel/Kconfig                        |   33 +
 sound/soc/sof/intel/apl.c                          |    4 +-
 sound/soc/sof/intel/bdw.c                          |  166 +-
 sound/soc/sof/intel/byt.c                          |  174 +-
 sound/soc/sof/intel/cnl.c                          |   36 +-
 sound/soc/sof/intel/hda-bus.c                      |   86 +-
 sound/soc/sof/intel/hda-codec.c                    |   50 +-
 sound/soc/sof/intel/hda-ctrl.c                     |   21 +-
 sound/soc/sof/intel/hda-dai.c                      |   38 +-
 sound/soc/sof/intel/hda-dsp.c                      |  100 +-
 sound/soc/sof/intel/hda-ipc.c                      |  150 +-
 sound/soc/sof/intel/hda.c                          |  132 +-
 sound/soc/sof/intel/hda.h                          |   18 +-
 sound/soc/sof/ipc.c                                |    8 +-
 sound/soc/sof/loader.c                             |  182 +-
 sound/soc/sof/ops.h                                |   46 +-
 sound/soc/sof/pcm.c                                |   66 +-
 sound/soc/sof/pm.c                                 |    6 +-
 sound/soc/sof/sof-of-dev.c                         |  143 ++
 sound/soc/sof/sof-pci-dev.c                        |   47 +
 sound/soc/sof/sof-priv.h                           |   19 +-
 sound/soc/sof/topology.c                           |  275 ++-
 sound/soc/sof/trace.c                              |    9 +-
 sound/soc/spear/spdif_in.c                         |    5 +-
 sound/soc/sprd/sprd-mcdt.c                         |    4 +-
 sound/soc/sti/sti_uniperif.c                       |    4 +-
 sound/soc/stm/stm32_i2s.c                          |    5 +-
 sound/soc/stm/stm32_sai.c                          |    8 +-
 sound/soc/stm/stm32_spdifrx.c                      |    4 +-
 sound/soc/sunxi/sun4i-codec.c                      |   14 +-
 sound/soc/sunxi/sun4i-i2s.c                        |  671 ++++---
 sound/soc/sunxi/sun50i-codec-analog.c              |    4 +-
 sound/soc/sunxi/sun8i-codec-analog.c               |    4 +-
 sound/soc/sunxi/sun8i-codec.c                      |    4 +-
 sound/soc/tegra/tegra20_das.c                      |    4 +-
 sound/soc/tegra/tegra30_ahub.c                     |    5 +-
 sound/soc/tegra/tegra30_i2s.c                      |    4 +-
 sound/soc/ti/Kconfig                               |    4 +-
 sound/soc/ti/ams-delta.c                           |   31 +-
 sound/soc/ti/davinci-evm.c                         |    2 +-
 sound/soc/ti/davinci-i2s.c                         |   90 +-
 sound/soc/ti/davinci-mcasp.c                       |  185 +-
 sound/soc/ti/edma-pcm.c                            |   17 +-
 sound/soc/ti/n810.c                                |    1 +
 sound/soc/ti/rx51.c                                |   15 +-
 sound/soc/uniphier/aio-cpu.c                       |   31 +-
 sound/soc/uniphier/aio-dma.c                       |    8 +-
 sound/soc/uniphier/aio.h                           |    1 +
 sound/soc/uniphier/evea.c                          |    4 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |    2 -
 sound/soc/xilinx/xlnx_i2s.c                        |    4 +-
 sound/soc/xilinx/xlnx_spdif.c                      |    3 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |    5 +-
 sound/soc/zte/zx-tdm.c                             |    1 -
 287 files changed, 12569 insertions(+), 7014 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50=
i-a64-codec-analog.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i=
-a33-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.=
txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sun50i-codec-an=
alog.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-a33-codec=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/sound/uda1334.txt
 rename sound/soc/intel/skylake/skl-nhlt.h =3D> include/sound/intel-nhlt.h =
(65%)
 create mode 100644 include/sound/soc-component.h
 create mode 100644 sound/hda/intel-nhlt.c
 create mode 100644 sound/soc/codecs/cs47l15.c
 create mode 100644 sound/soc/codecs/cs47l92.c
 create mode 100644 sound/soc/codecs/uda1334.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ehl-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-tgl-match.c
 delete mode 100644 sound/soc/nuc900/Kconfig
 delete mode 100644 sound/soc/nuc900/Makefile
 delete mode 100644 sound/soc/nuc900/nuc900-ac97.c
 delete mode 100644 sound/soc/nuc900/nuc900-audio.c
 delete mode 100644 sound/soc/nuc900/nuc900-audio.h
 delete mode 100644 sound/soc/nuc900/nuc900-pcm.c
 create mode 100644 sound/soc/soc-component.c
 create mode 100644 sound/soc/soc-dai.c
 create mode 100644 sound/soc/sof/imx/Kconfig
 create mode 100644 sound/soc/sof/imx/Makefile
 create mode 100644 sound/soc/sof/imx/imx8.c
 create mode 100644 sound/soc/sof/sof-of-dev.c

--sdEQJo40s7ofW8iR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl13c24ACgkQJNaLcl1U
h9Ap3Qf+IRZem8//V7xlT2rJK4/6SlXKkNe3qd5QMKG8o8RpILkdjHkBnfAN9jy6
gV7hWSoEwsugXyHgg8CdIv97oElsaCVCyKypkxdO9JHt90dr6qtdG3KYSURas3E+
LaRbUQ2xaqJA/wvyxiWzTq7A49Hs0CB1AMwCgqSMetX7he3K2R8e96qEltiXdNlC
nw2EX64o9UanSm73m/JyT6qYyTrOg/sbjS56dV16Yw6wr9Q0FSdS9cy1joZkRqLl
anfkUspvNSX++PyrDC39xHz+oG8B3X+EsmROMYRS+KQ2F3aEjWMNG+GU/NoprlyQ
t5lvyuKPJsHCiLNQ5IxgVhoA1FA30w==
=D5Sx
-----END PGP SIGNATURE-----

--sdEQJo40s7ofW8iR--

--===============2889193049872454511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2889193049872454511==--
