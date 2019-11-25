Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C9108F3F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 14:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67801807;
	Mon, 25 Nov 2019 14:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67801807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574689882;
	bh=UurOJy1VTKoYiEqaBt2aVTjw3TcAnoI6FSHSTgGAHUA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r8/mQnVpRM4r9b65llFc9dQxYt9wIz2Ss+5CfC8KI06ebEYNJXu2RhXtnLoLK9R4V
	 pCiNGF8XbrHsGT/RXh/4lb5mY53fnvDHYPyWMh7dJ9n5+qVTHi9S0ZAsR3i/DG+gOY
	 4gnUj2Dph6dwDm/xbf9i4P5M1PAgAsW4mh/VEh84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C5CEF801DA;
	Mon, 25 Nov 2019 14:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF4A6F800DF; Mon, 25 Nov 2019 13:58:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_13, PRX_BODY_135, PRX_BODY_26, PRX_BODY_76,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C6FE4F800DF
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 13:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FE4F800DF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFFB31B;
 Mon, 25 Nov 2019 04:57:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6352B3F68E;
 Mon, 25 Nov 2019 04:57:52 -0800 (PST)
Date: Mon, 25 Nov 2019 12:57:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191125125750.GA4535@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: -- Owen Meredith
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 25 Nov 2019 14:48:50 +0100
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC updates for v5.5
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
Content-Type: multipart/mixed; boundary="===============0411439845749506502=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0411439845749506502==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 976a68f06b2ea49e2ab67a5f84919a8b105db8be:

  ALSA: usb-audio: Fix incorrect size check for processing/extension units =
(2019-11-14 18:01:22 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-v5.5-2

for you to fetch changes up to 8c4d2a0bfbd27d030e4652b714cd5a1598f3559b:

  Merge branch 'asoc-5.5' into asoc-next (2019-11-22 19:56:02 +0000)

----------------------------------------------------------------
ASoC: More updates for v5.5

Some more development work for v5.5.  Highlights include:

 - More cleanups from Morimoto-san.
 - Trigger word detection for RT5677.

----------------------------------------------------------------

The changelog and diffstat are both messed up by additional changes from
Linus' tree that I have, not clear how to fix that with request-pull.

Aaron Komisar (1):
      mac80211: fix scan when operating on DFS channels in ETSI domains

Adam Ford (5):
      ARM: dts: logicpd-torpedo-som: Remove twl_keypad
      serial: mctrl_gpio: Check for NULL pointer
      serial: 8250_omap: Fix gpio check for auto RTS/CTS
      ARM: dts: imx6q-logicpd: Re-Enable SNVS power key
      ARM: dts: imx6-logicpd: Re-enable SNVS power key

Adam Zerella (3):
      docs: arm64: Fix indentation and doc formatting
      docs: hwmon: Include 'inspur-ipsps1.rst' into docs
      hwmon: docs: Extend inspur-ipsps1 title underline

Adit Ranadive (1):
      RDMA/vmw_pvrdma: Free SRQ only once

Adrian Hunter (1):
      perf tools: Fix mode setting in copyfile_mode_ns()

Ahmed Zaki (1):
      mac80211: fix station inactive_time shortly after boot

Aidan Yang (1):
      drm/amd/display: Allow inverted gamma

Al Viro (13):
      Fix the locking in dcache_readdir() and friends
      shmem: fix LSM options parsing
      libfs: take cursors out of list when moving past the end of directory
      xtensa: fix {get,put}_user() for 64bit values
      autofs: fix a leak in autofs_expire_indirect()
      ceph: fix RCU case handling in ceph_d_revalidate()
      ceph: add missing check in d_revalidate snapdir handling
      cgroup: don't put ERR_PTR() into fc->root
      exportfs_decode_fh(): negative pinned may become positive without the=
 parent locked
      audit_get_nd(): don't unlock parent too early
      ecryptfs: fix unlink and rmdir in face of underlying fs modifications
      ecryptfs_lookup_interpose(): lower_dentry->d_inode is not stable
      ecryptfs_lookup_interpose(): lower_dentry->d_parent is not stable eit=
her

Alain Volmat (1):
      i2c: stm32f7: remove warning when compiling with W=3D1

Alan Mikhak (1):
      irqchip/sifive-plic: Skip contexts except supervisor in plic_init()

Alan Somers (1):
      fuse: Add changelog entries for protocols 7.1 - 7.8

Alan Stern (6):
      HID: Fix assumption that devices have inputs
      USB: yurex: Don't retry on unexpected errors
      USB: Skip endpoints with 0 maxpacket length
      usb-storage: Revert commit 747668dbc061 ("usb-storage: Set virt_bound=
ary_mask to avoid SG overflows")
      UAS: Revert commit 3ae62a42090f ("UAS: fix alignment of scatter/gathe=
r segments")
      USB: gadget: Reject endpoints with 0 maxpacket value

Aleksa Sarai (1):
      lib: test_user_copy: style cleanup

Aleksander Morgado (2):
      net: usb: qmi_wwan: add support for DW5821e with eSIM support
      net: usb: qmi_wwan: add support for Foxconn T77W968 LTE modules

Alex Deucher (10):
      drm/amdgpu/powerplay: fix typo in mvdd table setup
      Revert "drm/radeon: Fix EEH during kexec"
      drm/amdgpu/uvd6: fix allocation size in enc ring test (v2)
      drm/amdgpu/uvd7: fix allocation size in enc ring test (v2)
      drm/amdgpu/vcn: fix allocation size in enc ring test
      drm/amdgpu/vce: fix allocation size in enc ring test
      drm/amdgpu/gmc10: properly set BANK_SELECT and FRAGMENT_SIZE
      drm/amdgpu/arcturus: properly set BANK_SELECT and FRAGMENT_SIZE
      drm/amdgpu/renoir: move gfxoff handling into gfx9 module
      drm/radeon: fix si_enable_smc_cac() failed issue

Alex Vesker (3):
      net/mlx5: DR, Allow insertion of duplicate rules
      net/mlx5: DR, Fix memory leak in modify action destroy
      net/mlx5: DR, Fix memory leak during rule creation

Alexander Potapenko (2):
      mm/slub.c: init_on_free=3D1 should wipe freelist ptr for bulk allocat=
ions
      lib/test_meminit: add a kmem_cache_alloc_bulk() test

Alexander Shishkin (11):
      perf/core: Fix inheritance of aux_output groups
      perf/aux: Fix AUX output stopping
      perf/core: Start rejecting the syscall with attr.__reserved_2 set
      intel_th: gth: Fix the window switching sequence
      intel_th: msu: Fix an uninitialized mutex
      intel_th: pci: Add Comet Lake PCH support
      intel_th: pci: Add Jasper Lake PCH support
      perf/aux: Fix the aux_output group inheritance fix
      perf/core: Reattach a misplaced comment
      perf/aux: Disallow aux_output for kernel events
      perf/core: Consistently fail fork on allocation failures

Alexander Sverdlin (1):
      net: ethernet: octeon_mgmt: Account for second possible VLAN header

Alexander Usyskin (1):
      mei: avoid FW version request on Ibex Peak and earlier

Alexandra Winter (2):
      s390/qeth: Fix error handling during VNICC initialization
      s390/qeth: Fix initialization of vnicc cmd masks during set online

Alexandre Belloni (3):
      net: lpc_eth: avoid resetting twice
      coccinelle: api/devm_platform_ioremap_resource: remove useless script
      clk: at91: avoid sleeping early

Alexandru Ardelean (1):
      iio: imu: adis16480: make sure provided frequency is positive

Alexey Brodkin (1):
      ARC: perf: Accommodate big-endian CPU

Aliasgar Surti (1):
      xfs: removed unused error variable from xchk_refcountbt_rec

Allen Pais (1):
      scsi: qla2xxx: fix a potential NULL pointer dereference

Amelie Delaunay (4):
      pinctrl: stmfx: fix null pointer on remove
      ARM: dts: stm32: remove OV5640 pinctrl definition on stm32mp157c-ev1
      ARM: dts: stm32: change joystick pinctrl definition on stm32mp157c-ev1
      pinctrl: stmfx: fix valid_mask init sequence

Andi Kleen (3):
      perf script brstackinsn: Fix recovery from LBR/binary mismatch
      perf jevents: Fix period for Intel fixed counters
      perf evlist: Fix fix for freed id arrays

Andrea Mayer (2):
      seg6: fix srh pointer in get_srh()
      seg6: fix skb transport_header after decap_and_validate()

Andrea Parri (1):
      x86/hyperv: Set pv_info.name to "Hyper-V"

Andreas Klinger (2):
      iio: adc: hx711: fix bug in sampling of data
      iio: srf04: fix wrong limitation in distance measuring

Andrew Duggan (3):
      Input: synaptics-rmi4 - disable the relative position IRQ in the F12 =
driver
      Input: synaptics-rmi4 - do not consume more data than we have (F11, F=
12)
      Input: synaptics-rmi4 - remove unused result_bits mask

Andrew Jeffery (4):
      dt-bindings: pinctrl: aspeed-g6: Rework SD3 function and groups
      pinctrl: aspeed-g6: Sort pins for sanity
      pinctrl: aspeed-g6: Fix I2C14 SDA description
      pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively

Andrew Lunn (1):
      net: usb: lan78xx: Connect PHY before registering MAC

Andrew Price (2):
      gfs2: Fix memory leak when gfs2meta's fs_context is freed
      gfs2: Fix initialisation of args for remount

Andrey Grodzovsky (2):
      drm/sched: Set error to s_fence if HW job submission failed.
      drm/amdgpu: If amdgpu_ib_schedule fails return back the error.

Andrey Smirnov (6):
      tty: serial: fsl_lpuart: Fix lpuart_flush_buffer()
      ARM: dts: am3874-iceboard: Fix 'i2c-mux-idle-disconnect' usage
      ARM: dts: vf610-zii-scu4-aib: Specify 'i2c-mux-idle-disconnect'
      HID: logitech-hidpp: split g920_get_config()
      HID: logitech-hidpp: rework device validation
      HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()

Andy Shevchenko (11):
      pinctrl: intel: Allocate IRQ chip dynamic
      platform/x86: intel_punit_ipc: Avoid error message when retrieving IRQ
      platform/x86: i2c-multi-instantiate: Fail the probe if no IRQ provided
      gpio: merrifield: Restore use of irq_base
      gpiolib: Initialize the hardware with a callback
      gpio: intel-mid: Move hardware initialization to callback
      gpio: lynxpoint: Move hardware initialization to callback
      gpio: merrifield: Move hardware initialization to callback
      gpio: lynxpoint: set default handler to be handle_bad_irq()
      pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
      pinctrl: cherryview: Allocate IRQ chip dynamic

Aneesh Kumar K.V (1):
      mm/memunmap: don't access uninitialized memmap in memunmap_pages()

Anna Karas (1):
      drm/i915/tgl: Fix doc not corresponding to code

Anshuman Khandual (1):
      mm/memremap: drop unused SECTION_SIZE and SECTION_MASK

Anson Huang (9):
      soc: imx: imx-scu: Getting UID from SCU should have response
      tty: serial: imx: Use platform_get_irq_optional() for optional IRQs
      ARM: dts: imx7s: Correct GPT's ipg clock source
      arm64: dts: imx8mq: Use correct clock for usdhc's ipg clk
      arm64: dts: imx8mm: Use correct clock for usdhc's ipg clk
      arm64: dts: imx8mn: Use correct clock for usdhc's ipg clk
      net: fec_main: Use platform_get_irq_byname_optional() to avoid error =
message
      net: fec_ptp: Use platform_get_irq_xxx_optional() to avoid error mess=
age
      watchdog: imx_sc_wdt: Pretimeout should follow SCU firmware format

Anton Eidelman (3):
      nvme-multipath: fix possible io hang after ctrl reconnect
      nvme-multipath: remove unused groups_only mode in ana log
      nvme-multipath: fix crash in nvme_mpath_clear_ctrl_paths

Anton Ivanov (1):
      um-ubd: Entrust re-queue to the upper layers

Antonio Borneo (3):
      ptp: fix typo of "mechanism" in Kconfig help text
      net: stmmac: fix length of PTP clock's name string
      net: stmmac: fix disabling flexible PPS output

Appana Durga Kedareswara rao (1):
      can: xilinx_can: Fix flags field initialization for axi can

Ard Biesheuvel (5):
      crypto: arm/aes-ce - build for v8 architecture explicitly
      crypto: arm/aes-ce - add dependency on AES library
      nvme: retain split access workaround for capability reads
      efivar/ssdt: Don't iterate over EFI vars if no SSDT override was spec=
ified
      efi: libstub/arm: Account for firmware reserved memory at the base of=
 RAM

Arkadiusz Kubalewski (1):
      i40e: Fix for ethtool -m issue on X722 NIC

Arnaldo Carvalho de Melo (17):
      tools headers uapi: Sync drm/i915_drm.h with the kernel sources
      tools headers uapi: Sync asm-generic/mman-common.h with the kernel
      tools headers uapi: Sync linux/usbdevice_fs.h with the kernel sources
      tools headers uapi: Sync linux/fs.h with the kernel sources
      tools headers kvm: Sync kvm headers with the kernel sources
      perf tools: Propagate get_cpuid() error
      perf evsel: Fall back to global 'perf_env' in perf_evsel__env()
      perf annotate: Propagate perf_env__arch() error
      perf annotate: Fix the signedness of failure returns
      perf annotate: Propagate the symbol__annotate() error return
      perf annotate: Fix arch specific ->init() failure errors
      perf annotate: Return appropriate error code for allocation failures
      perf annotate: Don't return -1 for error when doing BPF disassembly
      tools headers kvm: Sync kvm headers with the kernel sources
      tools headers kvm: Sync kvm headers with the kernel sources
      tools headers kvm: Sync kvm.h headers with the kernel sources
      tools headers UAPI: Sync sched.h with the kernel

Arnd Bergmann (6):
      udc: lpc32xx: fix 64-bit compiler warning
      dynamic_debug: provide dynamic_hex_dump stub
      usb: dwc3: select CONFIG_REGMAP_MMIO
      net: dsa: sja1105: improve NET_DSA_SJA1105_TAS dependency
      watchdog: cpwd: fix build regression
      ntp/y2038: Remove incorrect time_t truncation

Arvind Sankar (2):
      lib/string: Make memzero_explicit() inline instead of external
      iommu/vt-d: Return the correct dma mask when we are bypassing the IOM=
MU

Austin Kim (2):
      fs: cifs: mute -Wunused-const-variable message
      btrfs: silence maybe-uninitialized warning in clone_range

Avri Altman (1):
      scsi: ufs-bsg: Wake the device before sending raw upiu commands

Axel Lin (2):
      regulator: fixed: Prevent NULL pointer dereference when !CONFIG_OF
      regulator: ti-abb: Fix timeout in ti_abb_wait_txdone/ti_abb_clear_all=
_txdone

Aya Levin (3):
      net/mlx5e: Fix ethtool self test: link speed
      net/mlx5e: Initialize on stack link modes bitmap
      devlink: Add method for time-stamp on reporter's dump

Ayala Beker (1):
      iwlwifi: fw api: support new API for scan config cmd

Baolin Wang (2):
      dmaengine: sprd: Fix the possible memory leak issue
      MAINTAINERS: Update the Spreadtrum SoC maintainer

Baoquan He (1):
      memcg: only record foreign writebacks with dirty pages when memcg is =
not disabled

Bard Liao (1):
      soundwire: intel: fix intel_register_dai PDI offsets and numbers

Bard liao (1):
      ASoC: rt5682: cancel jack_detect_work if hs_jack is set to null

Bart Van Assche (3):
      RDMA/iwcm: Fix a lock inversion issue
      scsi: ch: Make it possible to open a ch device multiple times again
      scsi: target: cxgbit: Fix cxgbit_fw4_ack()

Bartosz Golaszewski (2):
      gpiolib: don't clear FLAG_IS_OUT when emulating open-drain/open-source
      ARM: davinci_all_defconfig: enable GPIO backlight

Bastien Nocera (1):
      USB: rio500: Remove Rio 500 kernel driver

Ben Dooks (6):
      efi: Make unexported efi_rci2_sysfs_init() static
      PM: sleep: include <linux/pm_runtime.h> for pm_wq
      kthread: make __kthread_queue_delayed_work static
      mm: include <linux/huge_mm.h> for is_vma_temporary_stack
      mm/filemap.c: include <linux/ramfs.h> for generic_file_vm_ops definit=
ion
      soc: imx: gpc: fix initialiser format

Ben Dooks (Codethink) (14):
      davinci_cpdma: make cpdma_chan_split_pool static
      net: stmmac: make tc_flow_parsers static
      net: stmmac: fix argument to stmmac_pcs_ctrl_ane()
      mm/init-mm.c: include <linux/mman.h> for vm_committed_as_batch
      ipv6: include <net/addrconf.h> for missing declarations
      timers/sched_clock: Include local timekeeping.h for missing declarati=
ons
      net: mvneta: make stub functions static inline
      net: hwbm: if CONFIG_NET_HWBM unset, make stub functions static
      usb: mtu3: fix missing include of mtu3_dr.h
      usb: cdns3: include host-export,h for cdns3_host_init
      usb: renesas_usbhs: fix __le16 warnings
      usb: renesas_usbhs: fix type of buf
      usb: xhci: fix __le32/__le64 accessors in debugfs code
      perf/core: Fix missing static inline on perf_cgroup_switch()

Ben Hutchings (1):
      drm/i915/cmdparser: Fix jump whitelist clearing

Ben Zhang (7):
      ASoC: rt5677: Load firmware via SPI using delayed work
      ASoC: bdw-rt5677: Add a DAI link for rt5677 SPI PCM device
      ASoC: rt5677: Enable jack detect while DSP is running
      ASoC: rt5677: Add DAPM audio path for hotword stream
      ASoC: rt5677: Mark reg RT5677_PWR_ANLG2 as volatile
      ASoC: rt5677: Stop and restart DSP over suspend/resume
      ASoC: rt5677: Disable irq at suspend

Beni Mahler (1):
      USB: serial: ftdi_sio: add device IDs for Sienna and Echelon PL-20

Benjamin Coddington (1):
      SUNRPC: fix race to sk_err after xs_error_report

Benjamin Herrenschmidt (1):
      net: ethernet: ftgmac100: Fix DMA coherency issue with SW checksum

Biao Huang (1):
      net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow

Biju Das (1):
      dt-bindings: serial: sh-sci: Document r8a774b1 bindings

Bill Kuzeja (1):
      xhci: Prevent deadlock when xhci adapter breaks during init

Bill O'Donnell (1):
      xfs: assure zeroed memory buffers for certain kmem allocations

Bjorn Andersson (2):
      arm64: cpufeature: Enable Qualcomm Falkor/Kryo errata 1003
      arm64: cpufeature: Enable Qualcomm Falkor errata 1009 for Kryo

Bj=C3=B6rn T=C3=B6pel (4):
      samples/bpf: Fix build for task_fd_query_user.c
      perf tools: Make usage of test_attr__* optional for perf-sys.h
      samples/bpf: fix build by setting HAVE_ATTR_TEST to zero
      bpf: Change size to u64 for bpf_map_{area_alloc, charge_init}()

Bodo Stroesser (1):
      scsi: target: core: Do not overwrite CDB byte 1

Boris Ostrovsky (1):
      x86/xen: Return from panic notifier

Brian Foster (3):
      xfs: log the inode on directory sf to block format change
      xfs: remove broken error handling on failed attr sf to leaf change
      xfs: move local to extent inode logging into bmap helper

Brian Norris (1):
      firmware: google: increment VPD key_len properly

Brian Vazquez (2):
      selftests/bpf: test_progs: Don't leak server_fd in tcp_rtt
      selftests/bpf: test_progs: Don't leak server_fd in test_sockopt_inher=
it

Bruce Chen (1):
      gpio: eic: sprd: Fix the incorrect EIC offset when toggling

Catalin Marinas (3):
      kmemleak: Do not corrupt the object_list during clean-up
      arm64: Ensure VM_WRITE|VM_SHARED ptes are clean by default
      arm64: Do not mask out PTE_RDONLY in pte_same()

Chandana Kishori Chiluveru (1):
      usb: gadget: composite: Fix possible double free memory bug

Charles Keepax (1):
      regulator: lochnagar: Add on_off_delay for VDDCORE

Charles Machalow (1):
      nvme: change nvme_passthru_cmd64 to explicitly mark rsvd

Chengguang Xu (1):
      ocfs2: fix error handling in ocfs2_setattr()

Chenwandun (2):
      zram: fix race between backing_dev_show and backing_dev_store
      net: aquantia: add an error handling in aq_nic_set_multicast_list

Chenyi Qiang (1):
      KVM: X86: Fix initialization of MSR lists

Chris Down (3):
      mm, memcg: proportional memory.{low,min} reclaim
      mm, memcg: make memory.emin the baseline for utilisation determination
      mm, memcg: make scan aggression always exclude protection

Chris Goldsworthy (1):
      of: reserved_mem: add missing of_node_put() for proper ref-counting

Chris Packham (1):
      pinctrl: iproc: allow for error from platform_get_irq()

Chris Wilson (15):
      drm/i915/execlists: Remove incorrect BUG_ON for schedule-out
      drm/i915: Perform GGTT restore much earlier during resume
      drm/i915: Don't mix srcu tag and negative error codes
      drm/i915: Extend Haswell GT1 PSMI workaround to all
      drm/i915: Verify the engine after acquiring the active.lock
      drm/i915: Prevent bonded requests from overtaking each other on preem=
ption
      drm/i915: Mark contents as dirty on a write fault
      drm/i915/execlists: Drop redundant list_del_init(&rq->sched.link)
      drm/i915: Only enqueue already completed requests
      drm/i915: Fixup preempt-to-busy vs reset of a virtual request
      drm/i915/execlists: Protect peeking at execlists->active
      drm/i915/gt: execlists->active is serialised by the tasklet
      drm/i915/execlists: Refactor -EIO markup of hung requests
      drm/i915/userptr: Never allow userptr into the mappable GGTT
      drm/i915: Fixup preempt-to-busy vs resubmission of a virtual request

Chris von Recklinghausen (1):
      arm64: Fix kcore macros after 52-bit virtual addressing fallout

Christian Borntraeger (1):
      s390/uaccess: avoid (false positive) compiler warnings

Christian Brauner (2):
      binder: prevent UAF read in print_binder_transaction_log_entry()
      clone3: validate stack arguments

Christian Gmeiner (1):
      drm/etnaviv: fix dumping of iommuv2

Christian K=C3=B6nig (4):
      drm/ttm: fix busy reference in ttm_mem_evict_first
      drm/ttm: fix handling in ttm_bo_add_mem_to_lru
      drm/amdgpu: fix potential VM faults
      drm/amdgpu: fix error handling in amdgpu_bo_list_create

Christoph Hellwig (3):
      serial/sifive: select SERIAL_EARLYCON
      riscv: cleanup <asm/bug.h>
      riscv: cleanup do_trap_break

Christophe JAILLET (4):
      tty: serial: owl: Fix the link time qualifier of 'owl_uart_exit()'
      tty: serial: rda: Fix the link time qualifier of 'rda_uart_exit()'
      RDMA/core: Fix an error handling path in 'res_get_common_doit()'
      memstick: jmb38x_ms: Fix an error handling path in 'jmb38x_ms_probe()'

Christophe Leroy (1):
      powerpc/32s: fix allow/prevent_user_access() when crossing segment bo=
undaries.

Christophe Roullier (1):
      ARM: dts: stm32: Fix CAN RAM mapping on stm32mp157c

Chuck Lever (1):
      NFSv4: Fix leak of clp->cl_acceptor string

Chuhong Yuan (9):
      cifs: Fix missed free operations
      net: ethernet: arc: add the missed clk_disable_unprepare
      net: fec: add missed clk_disable_unprepare in remove
      rsxx: add missed destroy_workqueue calls in remove
      Input: synaptics-rmi4 - destroy F54 poller workqueue when removing
      net: ep93xx_eth: fix mismatch of request_mem_region in remove
      net: gemini: add missed free_netdev
      ASoC: wm2200: add missed operations in remove and probe failure
      ASoC: wm5100: add missed pm_runtime_disable

Claudiu Manoil (2):
      net: mscc: ocelot: don't handle netdev events for other netdevs
      net: mscc: ocelot: fix NULL pointer on LAG slave removal

Colin Ian King (12):
      HID: prodikeys: make array keys static const, makes object smaller
      efi/tpm: Fix sanity check of unsigned tbl_size being less than zero
      staging: wlan-ng: fix exit return when sme->key_idx >=3D NUM_WEPKEYS
      8250-men-mcb: fix error checking when get_num_ports returns -ENODEV
      clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18
      qed: fix spelling mistake "queuess" -> "queues"
      intel_th: msu: Fix missing allocation failure check on a kstrndup
      intel_th: msu: Fix overflow in shift of an unsigned int
      can: j1939: fix resource leak of skb on error return paths
      staging: vboxsf: fix dereference of pointer dentry before it is null =
checked
      ice: fix potential infinite loop because loop counter being too small
      ASoC: tas2770: clean up an indentation issue

Cong Wang (2):
      net_sched: fix backward compatibility for TCA_KIND
      net_sched: fix backward compatibility for TCA_ACT_KIND

Connor Kuehl (1):
      staging: rtl8188eu: fix null dereference when kzalloc fails

Corentin Labbe (2):
      lib: Remove select of inexistant GENERIC_IO
      net: ethernet: dwmac-sun8i: Use the correct function in exit path

Cristian Birsan (1):
      usb: gadget: udc: atmel: Fix interrupt storm in FIFO mode.

Cristian Marussi (2):
      kselftest: add capability to skip chosen TARGETS
      kselftest: exclude failed TARGETS from runlist

Curtis Malainey (4):
      ASoC: rt5677: Allow VAD to be shut on/off at all times
      ASoC: bdw-rt5677: Turn on MCLK1 for DSP via DAPM
      ASoC: rt5677: Set ADC clock to use PLL and enable ASRC
      ASoC: rt5677: Wait for DSP to boot before loading firmware

C=C3=A9dric Le Goater (1):
      net/ibmvnic: Fix EOI when running in XIVE mode.

Dag Moxnes (1):
      rds: ib: update WR sizes when bringing up connection

Damien Le Moal (3):
      scsi: core: save/restore command resid for error handling
      block: Fix elv_support_iosched()
      scsi: sd_zbc: Fix sd_zbc_complete()

Dan Carpenter (11):
      usb: cdns3: Fix use after free in probe error handling
      usb: typec: tcpm: usb: typec: tcpm: Fix a signedness bug in tcpm_fw_g=
et_caps()
      pinctrl: ns2: Fix off by one bugs in ns2_pinmux_enable()
      mm/vmpressure.c: fix a signedness bug in vmpressure_register_event()
      USB: legousbtower: fix a signedness bug in tower_probe()
      ACPI: NFIT: Fix unlock on error in scrub_show()
      RDMA/uverbs: Prevent potential underflow
      iocost: don't nest spin_lock_irq in ioc_weight_write()
      netfilter: ipset: Fix an error code in ip_set_sockfn_get()
      block: drbd: remove a stray unlock in __drbd_send_protocol()
      net: cdc_ncm: Signedness bug in cdc_ncm_set_dgram_size()

Dan Murphy (1):
      leds: core: Fix leds.h structure documentation

Dan Williams (2):
      libata/ahci: Fix PCS quirk application
      fs/dax: Fix pmd vs pte conflict detection

Daniel Black (1):
      ACPI: HMAT: ACPI_HMAT_MEMORY_PD_VALID is deprecated since ACPI-6.3

Daniel Borkmann (3):
      bpf: Fix use after free in subprog's jited symbol removal
      bpf: Fix use after free in bpf_get_prog_name
      bpf, doc: Add Andrii as official reviewer to BPF subsystem

Daniel Wagner (4):
      scsi: qla2xxx: Remove WARN_ON_ONCE in qla2x00_status_cont_entry()
      scsi: lpfc: Check queue pointer before use
      scsi: lpfc: Honor module parameter lpfc_use_adisc
      net: usb: lan78xx: Disable interrupts before calling generic_handle_i=
rq()

Daniele Palmas (2):
      USB: serial: option: add Telit FN980 compositions
      net: usb: qmi_wwan: add Telit 0x1050 composition

Darrick J. Wong (1):
      xfs: change the seconds fields in xfs_bulkstat to signed

Dave Airlie (18):
      Merge tag 'drm-misc-fixes-2019-10-10' of git://anongit.freedesktop.or=
g/drm/drm-misc into drm-fixes
      Merge tag 'drm-fixes-5.4-2019-10-09' of git://people.freedesktop.org/=
~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2019-10-10' of git://anongit.freedesktop.o=
rg/drm/drm-intel into drm-fixes
      Merge tag 'drm-intel-fixes-2019-10-17' of git://anongit.freedesktop.o=
rg/drm/drm-intel into drm-fixes
      Merge tag 'drm-fixes-5.4-2019-10-16' of git://people.freedesktop.org/=
~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2019-10-17' of git://anongit.freedesktop.or=
g/drm/drm-misc into drm-fixes
      Merge tag 'drm-misc-fixes-2019-10-23' of git://anongit.freedesktop.or=
g/drm/drm-misc into drm-fixes
      Merge tag 'drm-fixes-5.4-2019-10-23' of git://people.freedesktop.org/=
~agd5f/linux into drm-fixes
      Merge branch 'etnaviv/fixes' of https://git.pengutronix.de/git/lst/li=
nux into drm-fixes
      Merge tag 'drm-misc-fixes-2019-10-30-1' of git://anongit.freedesktop.=
org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2019-10-31' of git://anongit.freedesktop.o=
rg/drm/drm-intel into drm-fixes
      Merge tag 'drm-fixes-5.4-2019-10-30' of git://people.freedesktop.org/=
~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2019-11-07-1' of git://anongit.freedesktop.=
org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2019-11-06' of git://anongit.freedesktop.o=
rg/drm/drm-intel into drm-fixes
      Merge tag 'drm-fixes-5.4-2019-11-06' of git://people.freedesktop.org/=
~agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2019-11-13' of git://anongit.freedesktop.o=
rg/drm/drm-intel into drm-fixes
      Merge tag 'drm-misc-fixes-2019-11-13' of git://anongit.freedesktop.or=
g/drm/drm-misc into drm-fixes
      Merge tag 'drm-fixes-5.4-2019-11-14' of git://people.freedesktop.org/=
~agd5f/linux into drm-fixes

Dave Wysochanski (2):
      cifs: use cifsInodeInfo->open_file_lock while iterating to avoid a pa=
nic
      cifs: Fix cifsInodeInfo lock_sem deadlock when reconnect occurs

Dave Young (1):
      efi/x86: Do not clean dummy variable in kexec path

David Abdurachmanov (1):
      riscv: fix fs/proc/kcore.c compilation with sparsemem enabled

David Ahern (3):
      net: Update address for vrf and l3mdev in MAINTAINERS
      selftests: Make l2tp.sh executable
      ipv4: Fix table id reference in fib_sync_down_addr

David Frey (1):
      iio: light: opt3001: fix mutex unlock race

David Hildenbrand (7):
      drivers/base/memory.c: don't access uninitialized memmaps in soft_off=
line_page_store()
      fs/proc/page.c: don't access uninitialized memmaps in fs/proc/page.c
      mm/memory-failure.c: don't access uninitialized memmaps in memory_fai=
lure()
      mm/memory_hotplug: don't access uninitialized memmaps in shrink_pgdat=
_span()
      hugetlbfs: don't access uninitialized memmaps in pfn_range_valid_giga=
ntic()
      mm/memory_hotplug: fix updating the node span
      mm/memory_hotplug: fix try_offline_node()

David Howells (9):
      rxrpc: Fix call ref leak
      rxrpc: Fix trace-after-put looking at the put peer record
      rxrpc: Fix trace-after-put looking at the put connection record
      rxrpc: Fix trace-after-put looking at the put call record
      rxrpc: rxrpc_peer needs to hold a ref on the rxrpc_local record
      rxrpc: Fix call crypto state cleanup
      rxrpc: Fix possible NULL pointer access in ICMP handling
      rxrpc: Fix handling of last subpacket of jumbo packet
      afs: Fix race in commit bulk status fetch

David Rientjes (1):
      mm, hugetlb: allow hugepage allocations to reclaim as needed

David S. Miller (44):
      Merge branch 'stmmac-fixes'
      Merge tag 'rxrpc-fixes-20191007' of git://git.kernel.org/.../dhowells=
/linux-fs
      Merge git://git.kernel.org/.../bpf/bpf
      Merge branch 'tcp-address-KCSAN-reports-in-tcp_poll-part-I'
      Merge branch 'aquantia-fixes'
      Merge tag 'wireless-drivers-for-davem-2019-10-15' of git://git.kernel=
=2Eorg/.../kvalo/wireless-drivers
      Merge branch 'mpls-push-pop-fix'
      Merge branch 'Update-MT7629-to-support-PHYLINK-API'
      Merge branch 'dpaa2-eth-misc-fixes'
      Merge branch 'net-bcmgenet-restore-internal-EPHY-support'
      Merge branch 'vsock-virtio-make-the-credit-mechanism-more-robust'
      Merge branch 'netem-fix-further-issues-with-packet-corruption'
      Merge tag 'mlx5-fixes-2019-10-18' of git://git.kernel.org/.../saeed/l=
inux
      Merge branch 'net-fix-nested-device-bugs'
      Merge branch 'smc-fixes'
      Merge branch 'ipv4-fix-route-update-on-metric-change'
      Merge git://git.kernel.org/.../bpf/bpf
      Merge git://git.kernel.org/.../pablo/nf
      Merge branch 'net-avoid-KCSAN-splats'
      Merge tag 'batadv-net-for-davem-20191025' of git://git.open-mesh.org/=
linux-merge
      Merge branch 'VLAN-fixes-for-Ocelot-switch'
      Merge tag 'mlx5-fixes-2019-10-24' of git://git.kernel.org/.../saeed/l=
inux
      Merge branch 'hv_netvsc-fix-error-handling-in-netvsc_attach-set_featu=
res'
      Merge tag 'mac80211-for-net-2019-10-31' of git://git.kernel.org/.../j=
berg/mac80211
      Merge tag 'wireless-drivers-2019-11-01' of git://git.kernel.org/.../k=
valo/wireless-drivers
      Merge branch '1GbE' of git://git.kernel.org/.../jkirsher/net-queue
      Merge branch 'fix-BPF-offload-related-bugs'
      Merge tag 'linux-can-fixes-for-5.4-20191105' of git://git.kernel.org/=
=2E../mkl/linux-can
      Merge git://git.kernel.org/.../bpf/bpf
      Merge branch 'net-bcmgenet-restore-internal-EPHY-support'
      Merge branch 'Bonding-fixes-for-Ocelot-switch'
      Merge branch 'net-tls-add-a-TX-lock'
      Merge git://git.kernel.org/.../pablo/nf
      Merge branch 'stmmac-fixes'
      Merge tag 'mlx5-fixes-2019-11-06' of git://git.kernel.org/.../saeed/l=
inux
      Merge tag 'mac80211-for-net-2019-11-08' of git://git.kernel.org/.../j=
berg/mac80211
      Merge branch '40GbE' of git://git.kernel.org/.../jkirsher/net-queue
      Merge branch 'master' of git://git.kernel.org/.../klassert/ipsec
      Merge tag 'linux-can-fixes-for-5.4-20191113' of git://git.kernel.org/=
=2E../mkl/linux-can
      Merge tag 'wireless-drivers-2019-11-14' of git://git.kernel.org/.../k=
valo/wireless-drivers
      Merge tag 'linux-can-fixes-for-5.4-20191114' of git://git.kernel.org/=
=2E../mkl/linux-can
      Merge branch 'hns3-fixes'
      Merge branch 'ptp-Validate-the-ancillary-ioctl-flags-more-carefully'
      Merge branch 'seg6-fixes-to-Segment-Routing-in-IPv6'

David Sterba (2):
      btrfs: don't needlessly create extent-refs kernel thread
      btrfs: un-deprecate ioctls START_SYNC and WAIT_SYNC

Davide Caratti (3):
      net: avoid errors when trying to pop MLPS header on non-MPLS packets
      net/sched: fix corrupted L2 header with MPLS 'push' and 'pop' actions
      ipvs: don't ignore errors in case refcounting ip_vs module fails

Denis Efremov (1):
      staging: rtl8188eu: fix HighestRate check in odm_ARFBRefresh_8188E()

Desnes A. Nunes do Rosario (1):
      selftests/powerpc: Fix compile error on tlbie_test due to newer gcc

Dexuan Cui (2):
      HID: hyperv: Use in-place iterator API in the channel callback
      Drivers: hv: vmbus: Fix harmless building warnings without CONFIG_PM_=
SLEEP

Dixit Parmar (1):
      Input: st1232 - fix reporting multitouch coordinates

Dmitry Bogdanov (2):
      net: aquantia: do not pass lro session with invalid tcp checksum
      net: aquantia: correctly handle macvlan and multicast coexistence

Dmitry Goldin (1):
      kheaders: substituting --sort in archive creation

Dmitry Torokhov (2):
      pinctrl: cherryview: restore Strago DMI workaround for all versions
      rt2x00: remove input-polldev.h header

Dmytro Linkin (3):
      net/mlx5e: Determine source port properly for vlan push action
      net/mlx5e: Remove incorrect match criteria assignment line
      net/mlx5e: Use correct enum to determine uplink port

Dominik Brodowski (1):
      efi/random: Treat EFI_RNG_PROTOCOL output as bootloader randomness

Don Brace (1):
      scsi: hpsa: add missing hunks in reset-patch

Dongsheng Yang (1):
      rbd: cancel lock_dwork if the wait is interrupted

Dotan Barak (1):
      mlx4_core: fix wrong comment about the reason of subtract one from th=
e max_cqes

Doug Berger (8):
      net: bcmgenet: don't set phydev->link from MAC
      net: phy: bcm7xxx: define soft_reset for 40nm EPHY
      net: bcmgenet: soft reset 40nm EPHYs before MAC init
      net: bcmgenet: reset 40nm EPHY on energy detect
      arm64: apply ARM64_ERRATUM_845719 workaround for Brahma-B53 core
      net: bcmgenet: use RGMII loopback for MAC reset
      Revert "net: bcmgenet: soft reset 40nm EPHYs before MAC init"
      net: bcmgenet: reapply manual settings to the PHY

Douglas Anderson (2):
      arm64: dts: rockchip: Fix override mode for rk3399-kevin panel
      MAINTAINERS: kgdb: Add myself as a reviewer for kgdb/kdb

Dragos Tarcatu (1):
      ASoC: SOF: topology: free kcontrol memory on error

Eli Britstein (1):
      net/mlx5: Fix NULL pointer dereference in extended destination

Emmanuel Nicolet (1):
      spufs: fix a crash in spufs_create_root()

Eran Ben Elisha (1):
      net/mlx4_core: Dynamically set guaranteed amount of counters per VF

Eric Auger (1):
      iommu/vt-d: Fix QI_DEV_IOTLB_PFSID and QI_DEV_EIOTLB_PFSID macros

Eric Biggers (6):
      llc: fix sk_buff leak in llc_sap_state_process()
      llc: fix sk_buff leak in llc_conn_service()
      llc: fix another potential sk_buff leak in llc_ui_sendmsg()
      llc: fix sk_buff refcounting in llc_conn_state_process()
      lib/generic-radix-tree.c: add kmemleak annotations
      fs/namespace.c: fix use-after-free of mount in mnt_warn_timestamp_exp=
iry()

Eric Dumazet (43):
      bonding: fix potential NULL deref in bond_update_slave_arr
      netfilter: conntrack: avoid possible false sharing
      tun: remove possible false sharing in tun_flow_update()
      net: avoid possible false sharing in sk_leave_memory_pressure()
      net: add {READ|WRITE}_ONCE() annotations on ->rskq_accept_head
      tcp: annotate lockless access to tcp_memory_pressure
      net: silence KCSAN warnings around sk_add_backlog() calls
      net: annotate sk->sk_rcvlowat lockless reads
      net: silence KCSAN warnings about sk->sk_backlog.len reads
      tcp: add rcu protection around tp->fastopen_rsk
      tcp: annotate tp->rcv_nxt lockless reads
      tcp: annotate tp->copied_seq lockless reads
      tcp: annotate tp->write_seq lockless reads
      tcp: annotate tp->snd_nxt lockless reads
      tcp: annotate tp->urg_seq lockless reads
      tcp: annotate sk->sk_rcvbuf lockless reads
      tcp: annotate sk->sk_sndbuf lockless reads
      tcp: annotate sk->sk_wmem_queued lockless reads
      hrtimer: Annotate lockless access to timer->base
      tcp: fix a possible lockdep splat in tcp_done()
      net: avoid potential infinite loop in tc_ctl_action()
      rxrpc: use rcu protection while reading sk->sk_user_data
      net: ensure correct skb->tstamp in various fragmenters
      net: reorder 'struct net' fields to avoid false sharing
      ipv4: fix IPSKB_FRAG_PMTU handling with fragmentation
      net/flow_dissector: switch to siphash
      ipvs: move old_secure_tcp into struct netns_ipvs
      net: add skb_queue_empty_lockless()
      udp: use skb_queue_empty_lockless()
      net: use skb_queue_empty_lockless() in poll() handlers
      net: use skb_queue_empty_lockless() in busy poll contexts
      net: add READ_ONCE() annotation in __skb_wait_for_more_packets()
      udp: fix data-race in udp_set_dev_scratch()
      net: annotate accesses to sk->sk_incoming_cpu
      net: annotate lockless accesses to sk->sk_napi_id
      net: increase SOMAXCONN to 4096
      tcp: increase tcp_max_syn_backlog max value
      inet: stop leaking jiffies on the wire
      powerpc/bpf: Fix tail call implementation
      dccp: do not leak jiffies on the wire
      net: prevent load/store tearing on sk->sk_stamp
      ipv6: fixes rt6_probe() and fib6_nh->last_probe init
      net: fix data-race in neigh_event_send()

Eric Sandeen (1):
      xfs: remove unused flags arg from xfs_get_aghdr_buf()

Eugen Hristev (2):
      clk: at91: sam9x60: fix programmable clock
      mmc: sdhci-of-at91: fix quirk2 overwrite

Eugeniy Paltsev (2):
      ARC: [plat-hsdk]: Enable on-board SPI NOR flash IC
      ARC: [plat-hsdk]: Enable on-boardi SPI ADC IC

Evan Green (1):
      Input: synaptics-rmi4 - avoid processing unknown IRQs

Evan Quan (1):
      drm/amdgpu: register gpu instance before fan boost feature enablment

Fabien Parent (2):
      clocksource/drivers/mediatek: Fix error handling
      i2c: mt65xx: fix NULL ptr dereference

Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Enable CONFIG_DRM_MSM
      ARM: dts: imx6qdl-sabreauto: Fix storm of accelerometer interrupts

Fabrice Gasnier (5):
      iio: adc: stm32-adc: move registers definitions
      iio: adc: stm32-adc: fix a race when using several adcs with dma and =
irq
      i2c: stm32f7: fix first byte to send in slave mode
      i2c: stm32f7: fix a race in slave mode with arbitration loss irq
      iio: adc: stm32-adc: fix stopping dma

Faiz Abbas (2):
      mmc: sdhci-omap: Fix Tuning procedure for temperatures < -20C
      mmc: cqhci: Commit descriptors before setting the doorbell

Felipe Balbi (1):
      usb: dwc3: gadget: fix race when disabling ep with cancelled xfers

Fernando Fernandez Mancera (1):
      netfilter: nf_tables: fix unexpected EOPNOTSUPP error

Filipe Manana (6):
      Btrfs: fix memory leak due to concurrent append writes with fiemap
      Btrfs: add missing extents release on file extent cluster relocation =
error
      Btrfs: fix qgroup double free after failure to reserve metadata for d=
elalloc
      Btrfs: check for the full sync flag while holding the inode lock duri=
ng fsync
      Btrfs: fix race leading to metadata space leak after task received si=
gnal
      Btrfs: fix log context list corruption after rename exchange operation

Florian Fainelli (11):
      net: dsa: b53: Do not clear existing mirrored port mask
      net: bcmgenet: Set phydev->dev_flags only for internal PHYs
      net: bcmgenet: Fix RGMII_MODE_EN value for GENET v1/2/3
      Merge tag 'tags/bcm2835-maintainers-next-2019-10-15' into maintainers=
/next
      MAINTAINERS: Remove Gregory and Brian for ARCH_BRCMSTB
      arm64: Brahma-B53 is SSB and spectre v2 safe
      arm64: apply ARM64_ERRATUM_843419 workaround for Brahma-B53 core
      net: phylink: Fix phylink_dbg() macro
      net: dsa: bcm_sf2: Fix IMP setup for port different than 8
      MAINTAINERS: Remove Kevin as maintainer of BMIPS generic platforms
      net: dsa: bcm_sf2: Fix driver removal

Florian Westphal (1):
      bridge: ebtables: don't crash when using dnat target in output chains

Florin Chiculita (1):
      dpaa2-eth: add irq for the dpmac connect/disconnect event

Frank Wunderlich (1):
      mfd: mt6397: Fix probe after changing mt6397-core

Frederic Barrat (1):
      powerpc/powernv/eeh: Fix oops when probing cxl devices

Frederic Weisbecker (1):
      sched/vtime: Fix guest/system mis-accounting on task switch

Fuqian Huang (1):
      xen/grant-table: remove unnecessary printing

Geert Uytterhoeven (9):
      staging: octeon: Use "(uintptr_t)" to cast from pointer to int
      mmc: renesas_sdhi: Do not use platform_get_irq() to count interrupts
      mmc: sh_mmcif: Use platform_get_irq_optional() for optional interrupt
      serial: sh-sci: Use platform_get_irq_optional() for optional interrup=
ts
      MAINTAINERS: Remove Simon as Renesas SoC Co-Maintainer
      iommu/ipmmu-vmsa: Only call platform_get_irq() when interrupt is mand=
atory
      clocksource/drivers/sh_mtu2: Do not loop using platform_get_irq_by_na=
me()
      perf/headers: Fix spelling s/EACCESS/EACCES/, s/privilidge/privilege/
      fbdev: c2p: Fix link failure on non-inlining

George G. Davis (2):
      selftests: watchdog: Validate optional file argument
      selftests: watchdog: Add command line option to show watchdog_info

Georgi Djakov (1):
      interconnect: Add locking in icc_set_tag()

Gerald Schaefer (1):
      s390/kaslr: add support for R_390_GLOB_DAT relocation type

Gomez Iglesias, Antonio (1):
      Documentation: Add ITLB_MULTIHIT documentation

Greentime Hu (1):
      RISC-V: fix virtual address overlapped in FIXADDR_START and VMEMMAP_S=
TART

Greg KH (1):
      RDMA/cxgb4: Do not dma memory off of the stack

Greg Kroah-Hartman (8):
      Merge tag 'usb-serial-5.4-rc2' of https://git.kernel.org/.../johan/us=
b-serial into usb-linus
      Merge tag 'iio-fixes-for-5.4a' of https://git.kernel.org/.../jic23/ii=
o into staging-linus
      Merge tag 'usb-serial-5.4-rc4' of https://git.kernel.org/.../johan/us=
b-serial into usb-linus
      Merge tag 'fixes-for-v5.4-rc5' of git://git.kernel.org/.../balbi/usb =
into usb-linus
      Merge tag 'iio-fixes-for-5.4b' of https://git.kernel.org/.../jic23/ii=
o into staging-linus
      Merge tag 'icc-5.4-rc5' of https://git.linaro.org/people/georgi.djako=
v/linux into char-misc-linus
      Merge tag 'thunderbolt-fixes-for-v5.4-1' of git://git.kernel.org/.../=
westeri/thunderbolt into char-misc-next
      Merge tag 'soundwire-5.4-rc6' of git://git.kernel.org/.../vkoul/sound=
wire into char-misc-linus

Greg Kurz (1):
      KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already in use

Guangbin Huang (1):
      net: hns3: add compatible handling for MAC VLAN switch parameter conf=
iguration

Guillaume Nault (2):
      netns: fix GFP flags in rtnl_net_notifyid()
      ipmr: Fix skb headroom in ipmr_get_route().

Guillem Jover (1):
      aio: Fix io_pgetevents() struct __compat_aio_sigset layout

Gustavo A. R. Silva (2):
      perf annotate: Fix multiple memory and file descriptor leaks
      usb: udc: lpc32xx: fix bad bit shift operation

GwanYeong Kim (1):
      usbip: tools: Fix read_usb_vudc_device() error path handling

Haim Dreyfuss (1):
      iwlwifi: mvm: force single phy init

Haishuang Yan (1):
      ip6erspan: remove the incorrect mtu limit for ip6erspan

Haiyang Zhang (2):
      hv_netvsc: Fix error handling in netvsc_set_features()
      hv_netvsc: Fix error handling in netvsc_attach()

Halil Pasic (1):
      s390/cio: fix virtio-ccw DMA without PV

Hannes Reinecke (3):
      scsi: scsi_dh_alua: handle RTPG sense code correctly during state tra=
nsitions
      scsi: lpfc: remove left-over BUILD_NVME defines
      scsi: qla2xxx: fixup incorrect usage of host_byte

Hans de Goede (12):
      driver core: platform: Add platform_get_irq_byname_optional()
      usb: dwc3: Switch to platform_get_irq_byname_optional()
      usb: dwc3: Remove dev_err() on platform_get_irq() failure
      Input: soc_button_array - partial revert of support for newer surface=
 devices
      iio: adc: axp288: Override TS pin bias current for some models
      drm/amdgpu: Bail earlier when amdgpu.cik_/si_support is not set to 1
      HID: i2c-hid: add Trekstor Primebook C11B to descriptor override
      pinctrl: cherryview: Fix irq_valid_mask calculation
      staging: Add VirtualBox guest shared folder (vboxsf) support
      HID: i2c-hid: Send power-on command after reset
      i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is prese=
nt
      ASoC: Intel: bytcr_rt5640: Update quirk for Acer Switch 10 SW5-012 2-=
in-1

Harshad Shirwadkar (1):
      blk-wbt: fix performance regression in wbt scale_up/scale_down

Heikki Krogerus (2):
      usb: typec: ucsi: ccg: Remove run_isr flag
      usb: typec: ucsi: displayport: Fix for the mode entering routine

Heiko Carstens (1):
      s390/idle: fix cpu idle time calculation

Heiko Stuebner (2):
      dt-bindings: arm: rockchip: fix Theobroma-System board bindings
      iommu/rockchip: Don't use platform_get_irq to implicitly count irqs

Heiner Kallweit (3):
      r8169: fix jumbo packet handling on resume from suspend
      r8169: fix wrong PHY ID issue with RTL8168dp
      r8169: fix page read in r8168g_mdio_read

Helge Deller (3):
      MAINTAINERS: Add hp_sdc drivers to parisc arch
      parisc: sysctl.c: Use CONFIG_PARISC instead of __hppa_ define
      parisc: Fix vmap memory leak in ioremap()/iounmap()

Herbert Xu (1):
      Revert "hwrng: core - Freeze khwrng thread during suspend"

Hillf Danton (1):
      net: openvswitch: free vport unless register_netdevice() succeeds

Himanshu Madhani (2):
      scsi: MAINTAINERS: Update qla2xxx driver
      scsi: qla2xxx: Initialized mailbox to prevent driver load failure

Honggang Li (1):
      configfs: calculate the depth of parent item

Honglei Wang (1):
      mm: memcg: get number of pages on the LRU list in memcgroup base on l=
ru_zone_size

Huacai Chen (1):
      timekeeping/vsyscall: Update VDSO data unconditionally

Huazhong Tan (1):
      net: hns3: add compatible handling for command HCLGE_OPC_PF_RST_DONE

Hugh Cole-Baker (1):
      arm64: dts: rockchip: fix Rockpro64 RK808 interrupt line

Ian Kent (1):
      vfs: add missing blkdev_put() in get_tree_bdev()

Ian Rogers (4):
      libsubcmd: Make _FORTIFY_SOURCE defines dependent on the feature
      perf tests: Avoid raising SEGV using an obvious NULL dereference
      perf docs: Allow man page date to be specified
      perf llvm: Don't access out-of-scope array

Ido Schimmel (3):
      mlxsw: spectrum_trap: Push Ethernet header before reporting trap
      netdevsim: Fix use-after-free during device dismantle
      selftests: mlxsw: Adjust test to recent changes

Igor Pylypiv (1):
      ixgbe: Remove duplicate clear_bit() call

Igor Russkikh (2):
      net: aquantia: temperature retrieval fix
      net: aquantia: when cleaning hw cache it should be toggled

Ilie Halip (1):
      scripts/tools-support-relr.sh: un-quote variables

Ilya Dryomov (1):
      rbd: silence bogus uninitialized warning in rbd_object_map_update_fin=
ish()

Ilya Leoshkevich (4):
      scripts/gdb: fix debugging modules on s390
      bpf: Allow narrow loads of bpf_sysctl fields with offset > 0
      s390/unwind: fix mixing regs and sp
      scripts/gdb: fix debugging modules compiled with hot/cold partitioning

Imre Deak (2):
      drm/i915: Avoid HPD poll detect triggering a new detect cycle
      drm/i915/gen8+: Add RC6 CTX corruption WA

Ingo Molnar (3):
      Merge tag 'perf-urgent-for-mingo-5.4-20191001' of git://git.kernel.or=
g/.../acme/linux into perf/urgent
      Merge branch 'x86/urgent' into perf/urgent, to pick up new CPU model =
definitions
      Merge tag 'perf-urgent-for-mingo-5.4-20191017' of git://git.kernel.or=
g/.../acme/linux into perf/urgent

Ioana Ciornei (1):
      dpaa2-eth: free already allocated channels on probe defer

Ioana Radulescu (1):
      dpaa2-eth: Fix TX FQID values

Ivan Khoronzhuk (1):
      taprio: fix panic while hw offload sched list swap

Jack Morgenstein (1):
      RDMA/cm: Fix memory leak in cm_add/remove_one

Jacky.Cao@sony.com (1):
      USB: dummy-hcd: fix power budget for SuperSpeed mode

Jacob Keller (8):
      net: update net_dim documentation after rename
      igb/igc: use ktime accessors for skb->tstamp
      net: reject PTP periodic output requests with unsupported flags
      mv88e6xxx: reject unsupported external timestamp flags
      dp83640: reject unsupported external timestamp flags
      igb: reject unsupported external timestamp flags
      mlx5: reject unsupported external timestamp flags
      renesas: reject unsupported external timestamp flags

Jacob Rasmussen (2):
      ASoC: rt5645: Fixed buddy jack support.
      ASoC: rt5645: Fixed typo for buddy jack support.

Jae Hyun Yoo (1):
      i2c: aspeed: fix master pending state handling

Jakub Kicinski (15):
      Merge branch 'llc-fix-sk_buff-refcounting'
      Merge tag 'mac80211-for-davem-2019-10-08' of git://git.kernel.org/...=
/jberg/mac80211
      Merge branch 's390-qeth-fixes'
      Merge branch 'smc-fixes'
      net: netem: fix error path for corrupted GSO frames
      net: netem: correct the parent's backlog when corrupted packet was dr=
opped
      Merge branch 'bnxt_en-bug-fixes'
      MAINTAINERS: remove Dave Watson as TLS maintainer
      selftests: bpf: Skip write only files in debugfs
      net: cls_bpf: fix NULL deref on offload filter removal
      net: fix installing orphaned programs
      net/tls: fix sk_msg trim on fallback to copy mode
      net/tls: don't pay attention to sk_write_pending when pushing partial=
 records
      net/tls: add a TX lock
      selftests/tls: add test for concurrent recv and send

James Erwin (1):
      IB/hfi1: Ensure full Gen3 speed in a Gen4 system

James Morse (3):
      arm64: Fix incorrect irqflag restore for priority masking for compat
      arm64: ftrace: Ensure synchronisation in PLT setup for Neoverse-N1 #1=
542419
      EDAC/ghes: Fix Use after free in ghes_edac remove path

Jan Beulich (1):
      x86/apic/32: Avoid bogus LDR warnings

Jan Schmidt (1):
      xhci: Check all endpoints for LPM timeout

Janakarajan Natarajan (1):
      x86/asm: Fix MWAITX C-state hint value

Jane Chu (1):
      mm/memory-failure: poison read receives SIGKILL instead of SIGBUS if =
mmaped more than once

Jani Nikula (1):
      drm/i915: update rawclk also on resume

Jann Horn (1):
      binder: Don't modify VMA bounds in ->mmap handler

Jaroslav Kysela (3):
      ASoC: add control components management
      ASoC: improve the DMI long card code in asoc-core
      ASoC: DMI long name - avoid to add board name if matches with product=
 name

Jason Gerecke (1):
      HID: wacom: generic: Treat serial number and related fields as unsign=
ed

Jason Gunthorpe (8):
      RDMA/mlx5: Do not allow rereg of a ODP MR
      RDMA/mlx5: Fix a race with mlx5_ib_update_xlt on an implicit MR
      RDMA/odp: Lift umem_mutex out of ib_umem_odp_unmap_dma_pages()
      RDMA/mlx5: Order num_pending_prefetch properly with synchronize_srcu
      RDMA/mlx5: Put live in the correct place for ODP MRs
      RDMA/mlx5: Add missing synchronize_srcu() for MW cases
      RDMA/mlx5: Use irq xarray locking for mkey_table
      mm/mmu_notifiers: use the right return code for WARN_ON

Jason Wang (1):
      vringh: fix copy direction of vringh_iov_push_kern()

Javier Martinez Canillas (1):
      efi/efi_test: Lock down /dev/efi_test and require CAP_SYS_ADMIN

Jay Vosburgh (1):
      bonding: fix state transition issue in link monitoring

Jayachandran C (1):
      MAINTAINERS: update Cavium ThunderX2 maintainers

Jean Delvare (1):
      firmware: dmi: Fix unlikely out-of-bounds read in save_mem_devices

Jean-Baptiste Maneyrol (1):
      iio: imu: inv_mpu6050: fix no data on MPU6050

Jeff Kirsher (1):
      i40e: Fix receive buffer starvation for AF_XDP

Jeff Layton (5):
      ceph: just skip unrecognized info in ceph_reply_info_extra
      ceph: don't try to handle hashed dentries in non-O_CREAT atomic_open
      ceph: return -EINVAL if given fsc mount option on kernel w/o support
      ceph: take the inode lock before acquiring cap refs
      ceph: increment/decrement dio counter on async requests

Jeffrey Hugo (2):
      drm/msm/dsi: Implement reset correctly
      dmaengine: qcom: bam_dma: Fix resource leak

Jens Axboe (13):
      io_uring: only flush workqueues on fileset removal
      io_uring: fix sequence logic for timeout requests
      Merge branch 'md-fixes' of https://git.kernel.org/.../song/md into fo=
r-linus
      io_uring: fix up O_NONBLOCK handling for sockets
      Merge branch 'nvme-5.4' of git://git.infradead.org/nvme into for-linus
      io_uring: revert "io_uring: optimize submit_and_wait API"
      io_uring: used cached copies of sq->dropped and cq->overflow
      io_uring: fix bad inflight accounting for SETUP_IOPOLL|SETUP_SQTHREAD
      io_uring: don't touch ctx in setup after ring fd install
      io_uring: ensure we clear io_kiocb->result before each issue
      Merge branch 'nvme-5.4-rc7' of git://git.infradead.org/nvme into for-=
linus
      io_uring: make timeout sequence =3D=3D 0 mean no sequence
      io_uring: ensure registered buffer import returns the IO length

Jernej Skrabec (2):
      arm64: dts: allwinner: a64: pine64-plus: Add PHY regulator delay
      arm64: dts: allwinner: a64: sopine-baseboard: Add PHY regulator delay

Jeroen Hofstee (10):
      can: peak_usb: report bus recovery as well
      can: c_can: D_CAN: c_can_chip_config(): perform a sofware reset on op=
en
      can: c_can: C_CAN: add bus recovery events
      can: rx-offload: can_rx_offload_irq_offload_timestamp(): continue on =
error
      can: ti_hecc: ti_hecc_stop(): stop the CPK on down
      can: ti_hecc: keep MIM and MD set
      can: ti_hecc: release the mailbox a bit earlier
      can: ti_hecc: add fifo overflow error reporting
      can: ti_hecc: properly report state changes
      can: ti_hecc: add missing state changes

Jerry Snitselaar (2):
      efi/tpm: Only set 'efi_tpm_final_log_size' after successful event log=
 parsing
      efi/tpm: Return -EINVAL when determining tpm final events log size fa=
ils

Jessica Yu (2):
      scripts/nsdeps: use alternative sed delimiter
      scripts/nsdeps: make sure to pass all module source files to spatch

Jia Guo (1):
      ocfs2: clear zero in unaligned direct IO

Jia-Ju Bai (3):
      fs: ocfs2: fix possible null-pointer dereferences in ocfs2_xa_prepare=
_entry()
      fs: ocfs2: fix a possible null-pointer dereference in ocfs2_write_end=
_nolock()
      fs: ocfs2: fix a possible null-pointer dereference in ocfs2_info_scan=
_inode_alloc()

Jia-Ye Li (1):
      staging: exfat: Use kvzalloc() instead of kzalloc() for exfat_sb_info

Jiangfeng Xiao (2):
      net: hisilicon: Fix "Trying to free already-free IRQ"
      net: hisilicon: Fix ping latency when deal with high throughput

Jiaxun Yang (1):
      MIPS: elf_hwcap: Export userspace ASEs

Jim Mattson (4):
      kvm: x86: Expose RDPID in KVM_GET_SUPPORTED_CPUID
      KVM: nVMX: Don't leak L1 MMIO regions to L2
      kvm: Allocate memslots and buses before calling kvm_arch_init_vm
      kvm: call kvm_arch_destroy_vm if vm creation fails

Jiri Benc (4):
      selftests/bpf: Set rp_filter in test_flow_dissector
      selftests/bpf: More compatible nc options in test_lwt_ip_encap
      bpf: lwtunnel: Fix reroute supplying invalid dst
      selftests/bpf: More compatible nc options in test_tc_edt

Jiri Olsa (2):
      perf/x86/intel/pt: Fix base for single entry topa
      perf tools: Fix time sorting

Jiri Pirko (3):
      mlxsw: core: Unpublish devlink parameters during reload
      devlink: disallow reload operation during device cleanup
      mlxsw: core: Enable devlink reload only on probe

Jiri Slaby (1):
      stacktrace: Don't skip first entry on noncurrent tasks

Jisheng Zhang (1):
      pinctrl: berlin: as370: fix a typo s/spififib/spdifib

Jiufei Xue (1):
      iocost: check active_list of all the ancestors in iocg_activate()

Joakim Zhang (1):
      can: flexcan: disable completely the ECC mechanism

Joao Martins (3):
      KVM: VMX: Consider PID.PIR to determine if vCPU has pending interrupts
      KVM: VMX: Do not change PID.NDST when loading a blocked vCPU
      KVM: VMX: Introduce pi_is_pir_empty() helper

Joe Perches (3):
      net: sctp: Rename fallthrough label to unhandled
      compiler_attributes.h: Add 'fallthrough' pseudo keyword for switch/ca=
se use
      Documentation/process: Add fallthrough pseudo-keyword

Joel Colledge (1):
      scripts/gdb: fix lx-dmesg when CONFIG_PRINTK_CALLER is set

Joel Fernandes (Google) (1):
      binder: Fix comment headers on binder_alloc_prepare_to_free()

Joel Stanley (1):
      clk: ast2600: Fix enabling of clocks

Joerg Roedel (3):
      Merge branch 'for-joerg/arm-smmu/fixes' of git://git.kernel.org/.../w=
ill/linux into iommu/fixes
      vfio/type1: Initialize resv_msi_base
      iommu/amd: Check PM_LEVEL_SIZE() condition in locked section

Johan Hovold (46):
      USB: serial: keyspan: fix NULL-derefs on open() and write()
      USB: microtek: fix info-leak at probe
      USB: adutux: fix use-after-free on disconnect
      USB: adutux: fix NULL-derefs on disconnect
      USB: usblcd: fix I/O after disconnect
      USB: usblcd: drop redundant disconnect mutex
      USB: usblcd: drop redundant lcd mutex
      USB: usblcd: use pr_err()
      USB: legousbtower: fix slab info leak at probe
      USB: legousbtower: fix deadlock on disconnect
      USB: legousbtower: fix potential NULL-deref on disconnect
      USB: legousbtower: fix open after failed reset request
      USB: usb-skeleton: fix runtime PM after driver unbind
      USB: usblp: fix runtime PM after driver unbind
      USB: serial: fix runtime PM after driver unbind
      media: stkwebcam: fix runtime PM after driver unbind
      NFC: pn533: fix use-after-free and memleaks
      USB: usb-skeleton: fix NULL-deref on disconnect
      USB: usb-skeleton: fix use-after-free after driver unbind
      USB: usb-skeleton: drop redundant in-urb check
      USB: legousbtower: fix use-after-free on release
      USB: ldusb: fix NULL-derefs on driver unbind
      USB: adutux: fix use-after-free on release
      USB: chaoskey: fix use-after-free on release
      USB: iowarrior: fix use-after-free on disconnect
      USB: iowarrior: fix use-after-free on release
      USB: iowarrior: fix use-after-free after driver unbind
      USB: iowarrior: drop redundant disconnect mutex
      USB: iowarrior: drop redundant iowarrior mutex
      USB: iowarrior: use pr_err()
      USB: yurex: fix NULL-derefs on disconnect
      USB: ldusb: fix memleak on disconnect
      USB: legousbtower: fix memleak on disconnect
      USB: usblp: fix use-after-free on disconnect
      USB: serial: ti_usb_3410_5052: fix port-close races
      USB: serial: ti_usb_3410_5052: clean up serial data access
      USB: ldusb: fix read info leaks
      s390/zcrypt: fix memleak at release
      USB: ldusb: fix ring-buffer locking
      USB: ldusb: use unsigned size format specifiers
      USB: ldusb: fix control-message timeout
      USB: serial: whiteheat: fix potential slab corruption
      USB: serial: whiteheat: fix line-speed endianness
      can: mcba_usb: fix use-after-free on disconnect
      can: usb_8dev: fix use-after-free on disconnect
      can: peak_usb: fix slab info leak

Johannes Berg (5):
      mac80211: accept deauth frames in IBSS mode
      iwlwifi: pcie: fix indexing in command dump for new HW
      iwlwifi: pcie: fix rb_allocator workqueue allocation
      iwlwifi: mvm: handle iwl_mvm_tvqm_enable_txq() error return
      mac80211: fix ieee80211_txq_setup_flows() failure path

Johannes Weiner (2):
      mm/page_alloc.c: ratelimit allocation failure warnings more aggressiv=
ely
      mm: memcontrol: fix network errors from failing __GFP_ATOMIC charges

John Donnelly (1):
      iommu/vt-d: Fix panic after kexec -p for kdump

John Garry (1):
      ACPI: CPPC: Set pcc_data[pcc_ss_id] to NULL in acpi_cppc_processor_ex=
it()

John Hubbard (3):
      mm/gup_benchmark: add a missing "w" to getopt string
      mm/gup: fix a misnamed "write" argument, and a related bug
      mm/gup_benchmark: fix MAP_HUGETLB case

John Hurley (1):
      net: sched: prevent duplicate flower rules from tcf_proto destroy race

Johnny Huang (3):
      pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
      pinctrl: aspeed-g6: Fix UART13 group pinmux
      pinctrl: aspeed-g6: Rename SD3 to EMMC and rework pin groups

Jon Bloomfield (10):
      drm/i915: Rename gen7 cmdparser tables
      drm/i915: Disable Secure Batches for gen6+
      drm/i915: Remove Master tables from cmdparser
      drm/i915: Add support for mandatory cmdparsing
      drm/i915: Support ro ppgtt mapped cmdparser shadow buffers
      drm/i915: Allow parsing of unsized batches
      drm/i915: Add gen9 BCS cmdparsing
      drm/i915/cmdparser: Use explicit goto for error paths
      drm/i915/cmdparser: Add support for backward jumps
      drm/i915/cmdparser: Ignore Length operands during command matching

Jonas Gorski (1):
      MIPS: bmips: mark exception vectors as char arrays

Jonathan Neusch=C3=A4fer (2):
      dt-bindings: usb: Fix references to usb-hcd.yaml
      Documentation: networking: device drivers: Remove stray asterisks

Jordan Niethe (1):
      powerpc/kvm: Fix kvmppc_vcore->in_guest value in kvmhv_switch_to_host

Jorge Ramirez-Ortiz (1):
      watchdog: pm8916_wdt: fix pretimeout registration flow

Jose Abreu (14):
      net: stmmac: selftests: Check if filtering is available before running
      net: stmmac: gmac4+: Not all Unicast addresses may be available
      net: stmmac: selftests: Fix L2 Hash Filter test
      net: stmmac: gmac4: bitrev32 returns u32
      net: stmmac: xgmac: bitrev32 returns u32
      net: stmmac: selftests: Prevent false positives in filter tests
      net: stmmac: xgmac: Only get SPH header len if available
      net: stmmac: xgmac: Fix TSA selection
      net: stmmac: xgmac: Fix AV Feature detection
      net: stmmac: xgmac: Disable Flow Control when 1 or more queues are in=
 AV
      net: stmmac: xgmac: Disable MMC interrupts by default
      net: stmmac: Fix the packet count in stmmac_rx()
      net: stmmac: Fix TSO descriptor with Enhanced Addressing
      net: stmmac: Fix the TX IOC in xmit path

Josef Bacik (6):
      btrfs: fix incorrect updating of log root tree
      btrfs: allocate new inode in NOFS context
      btrfs: fix uninitialized ret in ref-verify
      nbd: protect cmd->status with cmd->lock
      nbd: handle racing with error'ed out commands
      btrfs: save i_size to avoid double evaluation of i_size_read in compr=
ess_file_range

Josh Poimboeuf (1):
      x86/speculation/taa: Fix printing of TAA_MSG_SMT on IBRS_ALL CPUs

Jos=C3=A9 Roberto de Souza (1):
      drm/i915/dp: Do not switch aux to TBT mode for non-TC ports

Jouni Hogander (2):
      slip: Fix memory leak in slip_open error path
      slcan: Fix memory leak in error path

Jozsef Kadlecsik (1):
      netfilter: ipset: Fix nla_policies to fully support NL_VALIDATE_STRICT

Juergen Gross (2):
      xen/netback: fix error path of xenvif_connect_data()
      xen: issue deprecation warning for 32-bit pv guest

Julien Grall (2):
      arm64: cpufeature: Effectively expose FRINT capability to userspace
      arm64: cpufeature: Treat ID_AA64ZFR0_EL1 as RAZ when SVE is not enabl=
ed

Julien Thierry (1):
      arm64: entry.S: Do not preempt from IRQ before all cpufeatures are en=
abled

Jun Lei (2):
      drm/amd/display: do not synchronize "drr" displays
      drm/amd/display: add 50us buffer as WA for pstate switch in active

Junaid Shahid (2):
      kvm: Add helper function for creating VM worker threads
      kvm: x86: mmu: Recovery of shattered NX large pages

Junichi Nomura (1):
      block: check bi_size overflow before merge

KP Singh (1):
      samples/bpf: Add a workaround for asm_inline

Kai-Heng Feng (5):
      xhci: Increase STS_SAVE timeout in xhci_suspend()
      drm/edid: Add 6 bpc quirk for SDC panel in Lenovo G50
      Revert "Input: elantech - enable SMBus on new (2018+) systems"
      HID: i2c-hid: Remove runtime power management
      x86/quirks: Disable HPET on Intel Coffe Lake platforms

Kaike Wan (4):
      IB/hfi1: Avoid excessive retry for TID RDMA READ request
      IB/hfi1: Ensure r_tid_ack is valid before building TID RDMA ACK packet
      IB/hfi1: Calculate flow weight based on QP MTU for TID RDMA
      IB/hfi1: TID RDMA WRITE should not return IB_WC_RNR_RETRY_EXC_ERR

Kairui Song (1):
      x86, efi: Never relocate kernel below lowest acceptable address

Kalle Valo (1):
      Merge tag 'iwlwifi-for-kalle-2019-10-09' of git://git.kernel.org/.../=
iwlwifi/iwlwifi-fixes

Kamal Heib (1):
      RDMA/qedr: Fix reported firmware version

Kan Liang (10):
      x86/cpu: Add Comet Lake to the Intel CPU models header
      perf/x86/intel: Add Comet Lake CPU support
      perf/x86/msr: Add Comet Lake CPU support
      perf/x86/cstate: Add Comet Lake CPU support
      perf/x86/msr: Add new CPU model numbers for Ice Lake
      perf/x86/cstate: Update C-state counters for Ice Lake
      perf/x86/intel: Add Tiger Lake CPU support
      perf/x86/msr: Add Tiger Lake CPU support
      perf/x86/cstate: Add Tiger Lake CPU support
      perf/x86/uncore: Fix event group support

Karsten Graul (2):
      net/smc: receive returns without data
      net/smc: receive pending data after RCV_SHUTDOWN

Kazutoshi Noguchi (1):
      r8152: add device id for Lenovo ThinkPad USB-C Dock Gen 2

Kees Cook (1):
      selftests/kselftest/runner.sh: Add 45 second timeout per test

Kefeng Wang (2):
      riscv: Fix implicit declaration of 'page_to_section'
      riscv: Fix undefined reference to vmemmap_populate_basepages

Keith Busch (6):
      null_blk: Fix zoned command return code
      nvme-pci: Free tagset if no IO queues
      nvme: Remove ADMIN_ONLY state
      nvme: Restart request timers in resetting state
      nvme: Prevent resets during paused controller state
      nvme: Wait for reset state when required

Kenneth Graunke (1):
      drm/i915: Whitelist COMMON_SLICE_CHICKEN2

Kevin Hao (2):
      nvme-pci: Set the prp2 correctly when using more than 4k page
      dump_stack: avoid the livelock of the dump_lock

Kevin Wang (1):
      drm/amd/swSMU: fix smu workload bit map error

Keyon Jie (6):
      ASoC: SOF: topology: fix missing NULL pointer check
      ASoC: SOF: Intel: hda: set L1SEN on S0ix suspend
      ASoC: SOF: PM: add state machine to comments
      ASoC: SOF: PM: add check before setting d0_substate
      ASoC: SOF: add helper to check if we should enter d0i3 suspend
      ASoC: SOF: PM: only suspend to D0I3 when needed

Kim Phillips (2):
      perf/x86/amd/ibs: Fix reading of the IBS OpData register and thus pre=
cise RIP validity
      perf/x86/amd/ibs: Handle erratum #420 only on the affected CPU family=
 (10h)

Kiran Gunda (1):
      regulator: qcom-rpmh: Fix PMIC5 BoB min voltage

Kirill A. Shutemov (3):
      proc/meminfo: fix output alignment
      mm/thp: fix node page state in split_huge_page_to_list()
      mm/thp: allow dropping THP from page cache

Kishon Vijay Abraham I (1):
      reset: Fix memory leak in reset_control_array_put()

Konstantin Khlebnikov (1):
      mm/memcontrol: update lruvec counters in mem_cgroup_move_account

Krishnamraju Eraparaju (3):
      RDMA/siw: Fix serialization issue in write_space()
      RDMA/iwcm: move iw_rem_ref() calls out of spinlock
      RDMA/siw: free siw_base_qp in kref release routine

Krzysztof Kozlowski (1):
      ASoC: Fix Kconfig indentation

Kuninori Morimoto (14):
      ASoC: fsi: switch to yaml base Documentation
      ASoC: soc-core: remove soc_is_dai_link_bound()
      ASoC: soc-core: merge snd_soc_register_dai() and soc_add_dai()
      ASoC: soc-core: merge snd_soc_unregister_dai() and soc_del_dai()
      ASoC: soc-core: merge snd_soc_add_dai_link() and soc_bind_dai_link()
      ASoC: soc-core: merge snd_soc_remove_dai_link() and soc_unbind_dai_li=
nk()
      ASoC: soc-core: merge soc_remove_component() and soc_cleanup_componen=
t()
      ASoC: soc-core: merge snd_soc_bind_card() and snd_soc_instantiate_car=
d()
      ASoC: soc-core: tidyup soc_probe_aux_devices()
      ASoC: soc-core: call snd_soc_dapm_shutdown() at soc_cleanup_card_reso=
urces()
      ASoC: soc-core: move snd_soc_unbind_card() next to snd_soc_bind_card()
      ASoC: soc-core: care card_probed at soc_cleanup_card_resources()
      ASoC: soc-component: tidyup snd_soc_pcm_component_new/free() parameter
      ASoC: soc-pcm: remove soc_pcm_private_free()

Kurt Van Dijck (1):
      can: c_can: c_can_poll(): only read status register after status IRQ

Kyle Mahlkuch (1):
      drm/radeon: Fix EEH during kexec

Larry Finger (1):
      rtlwifi: rtl_pci: Fix problem of too small skb->len

Lasse Collin (1):
      lib/xz: fix XZ_DYNALLOC to avoid useless memory reallocations

Laura Abbott (2):
      rtlwifi: Fix potential overflow on P2P code
      mm: slub: really fix slab walking for init_on_free

Laurent Dufour (1):
      powerpc/pseries: Remove confusing warning message.

Laurent Pinchart (5):
      drm/panel: lg-lb035q02: Fix SPI alias
      drm/panel: nec-nl8048hl11: Fix SPI alias
      drm/panel: sony-acx565akm: Fix SPI alias
      drm/panel: tpo-td028ttec1: Fix SPI alias
      drm/panel: tpo-td043mtea1: Fix SPI alias

Leon Romanovsky (1):
      RDMA/nldev: Reshuffle the code to avoid need to rebind QP in error pa=
th

Leonard Crestez (2):
      interconnect: qcom: Fix icc_onecell_data allocation
      clk: imx8m: Use SYS_PLL1_800M as intermediate parent of CLK_ARM

Li Xu (1):
      ASoC: wm_adsp: Expose mixer control API

Liam Girdwood (2):
      ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names.
      ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names.

Lijun Ou (1):
      RDMA/hns: Prevent memory leaks of eq->buf_list

Linus Torvalds (199):
      uaccess: implement a proper unsafe_copy_to_user() and switch filldir =
over to it
      Merge branch 'akpm' (patches from Andrew)
      Merge tag 'linux-kselftest-5.4-rc3' of git://git.kernel.org/.../shuah=
/linux-kselftest
      Merge tag 'selinux-pr-20191007' of git://git.kernel.org/.../pcmoore/s=
elinux
      Merge tag 'gpio-v5.4-2' of git://git.kernel.org/.../linusw/linux-gpio
      Merge tag 'led-fixes-for-5.4-rc3' of git://git.kernel.org/.../j.anasz=
ewski/linux-leds
      Merge tag 'arm64-fixes' of git://git.kernel.org/.../arm64/linux
      Merge tag 'for-linus' of git://git.kernel.org/.../rdma/rdma
      Merge branch 'work.mount3' of git://git.kernel.org/.../viro/vfs
      Merge branch 'work.dcache' of git://git.kernel.org/.../viro/vfs
      Merge tag 'for-5.4-rc2-tag' of git://git.kernel.org/.../kdave/linux
      Merge branch 'linus' of git://git.kernel.org/.../herbert/crypto-2.6
      Merge tag 'xfs-5.4-fixes-3' of git://git.kernel.org/pub/scm/fs/xfs/xf=
s-linux
      Merge tag 'for-linus-20191010' of git://git.kernel.dk/linux-block
      Merge tag 'drm-fixes-2019-10-11' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'hyperv-fixes-signed' of git://git.kernel.org/.../hyperv/li=
nux
      Merge tag 'modules-for-v5.4-rc3' of git://git.kernel.org/.../jeyu/lin=
ux
      Merge tag '5.4-rc2-smb3' of git://git.samba.org/sfrench/cifs-2.6
      Merge tag 'nfs-for-5.4-2' of git://git.linux-nfs.org/projects/anna/li=
nux-nfs
      Merge tag 's390-5.4-4' of git://git.kernel.org/.../s390/linux
      Merge tag 'for-linus-5.4-rc3-tag' of git://git.kernel.org/.../xen/tip
      Merge tag 'powerpc-5.4-3' of git://git.kernel.org/.../powerpc/linux
      Merge tag 'mips_fixes_5.4_2' of git://git.kernel.org/.../mips/linux
      Merge tag 'riscv/for-v5.4-rc3' of git://git.kernel.org/.../riscv/linux
      Merge branch 'core-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'efi-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'sched-urgent-for-linus' of git://git.kernel.org/.../tip=
/tip
      Merge tag 'usb-5.4-rc3' of git://git.kernel.org/.../gregkh/usb
      Merge tag 'tty-5.4-rc3' of git://git.kernel.org/.../gregkh/tty
      Merge tag 'staging-5.4-rc3' of git://git.kernel.org/.../gregkh/staging
      Merge tag 'char-misc-5.4-rc3' of git://git.kernel.org/.../gregkh/char=
-misc
      Merge tag 'for-linus-20191012' of git://git.kernel.dk/linux-block
      Merge tag 'fixes-for-5.4-rc3' of git://git.kernel.org/.../mtd/linux
      Merge tag 'hwmon-for-v5.4-rc3' of git://git.kernel.org/.../groeck/lin=
ux-staging
      Merge tag 'trace-v5.4-rc2' of git://git.kernel.org/.../rostedt/linux-=
trace
      Linux 5.4-rc3
      Merge branch 'akpm' (patches from Andrew)
      Merge branch 'dmi-for-linus' of git://git.kernel.org/.../jdelvare/sta=
ging
      Merge branch 'parisc-5.4-2' of git://git.kernel.org/.../deller/parisc=
-linux
      sparc64: disable fast-GUP due to unexplained oopses
      Merge tag 'scsi-fixes' of git://git.kernel.org/.../jejb/scsi
      Merge tag 'for_linus' of git://git.kernel.org/.../mst/vhost
      Merge tag 'gpio-v5.4-3' of git://git.kernel.org/.../linusw/linux-gpio
      Merge tag 'platform-drivers-x86-v5.4-3' of git://git.infradead.org/li=
nux-platform-drivers-x86
      Merge branch 'for-linus' of git://git.kernel.org/.../dtor/input
      Merge tag 'drm-fixes-2019-10-18' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'xfs-5.4-fixes-4' of git://git.kernel.org/pub/scm/fs/xfs/xf=
s-linux
      Merge tag 'xtensa-20191017' of git://github.com/jcmvbkbc/linux-xtensa
      Merge tag 'arm64-fixes' of git://git.kernel.org/.../arm64/linux
      Merge tag 'mkp-scsi-postmerge' of git://git.kernel.org/.../mkp/scsi
      Merge tag 'pm-5.4-rc4' of git://git.kernel.org/.../rafael/linux-pm
      Merge tag 'acpi-5.4-rc4' of git://git.kernel.org/.../rafael/linux-pm
      Merge tag 'sound-5.4-rc4' of git://git.kernel.org/.../tiwai/sound
      Merge tag 'mmc-v5.4-rc1' of git://git.kernel.org/.../ulfh/mmc
      Merge tag 'copy-struct-from-user-v5.4-rc4' of gitolite.kernel.org:pub=
/scm/linux/kernel/git/brauner/linux
      Merge tag 'iommu-fixes-v5.4-rc3' of git://git.kernel.org/.../joro/iom=
mu
      Merge tag 'for-5.4/dm-fixes' of git://git.kernel.org/.../device-mappe=
r/linux-dm
      Merge tag 'ceph-for-5.4-rc4' of git://github.com/ceph/ceph-client
      filldir[64]: remove WARN_ON_ONCE() for bad directory entries
      Merge tag 'riscv/for-v5.4-rc4' of git://git.kernel.org/.../riscv/linux
      Merge tag 'for-linus-2019-10-18' of git://git.kernel.dk/linux-block
      Merge branch 'akpm' (patches from Andrew)
      Merge git://git.kernel.org/.../netdev/net
      Merge branch 'core-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'timers-urgent-for-linus' of git://git.kernel.org/.../ti=
p/tip
      Merge branch 'irq-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge tag 'kbuild-fixes-v5.4-2' of git://git.kernel.org/.../masahiroy=
/linux-kbuild
      Linux 5.4-rc4
      Merge tag 'pinctrl-v5.4-2' of git://git.kernel.org/.../linusw/linux-p=
inctrl
      Merge tag 'for-5.4-rc4-tag' of git://git.kernel.org/.../kdave/linux
      Merge tag 'edac_urgent_for_5.4' of git://git.kernel.org/.../ras/ras
      Merge tag 'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm
      Merge tag 'regulator-fix-v5.4-rc4' of git://git.kernel.org/.../brooni=
e/regulator
      Merge tag 'vfio-v5.4-rc5' of git://github.com/awilliam/linux-vfio
      Merge tag 'trace-v5.4-rc3-3' of git://git.kernel.org/.../rostedt/linu=
x-trace
      Merge tag 'sound-5.4-rc5' of git://git.kernel.org/.../tiwai/sound
      Merge tag 'mfd-fixes-5.4' of git://git.kernel.org/.../lee/mfd
      Merge tag 'gfs2-v5.4-rc4.fixes' of git://git.kernel.org/.../gfs2/linu=
x-gfs2
      Merge tag 'pm-5.4-rc5' of git://git.kernel.org/.../rafael/linux-pm
      Merge tag 'acpi-5.4-rc5' of git://git.kernel.org/.../rafael/linux-pm
      Merge tag 'devicetree-fixes-for-5.4-2' of git://git.kernel.org/.../ro=
bh/linux
      Merge tag 'mmc-v5.4-rc4' of git://git.kernel.org/.../ulfh/mmc
      Merge tag 'drm-fixes-2019-10-25' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
      Merge tag 'armsoc-fixes' of git://git.kernel.org/.../soc/soc
      Merge tag 'modules-for-v5.4-rc5' of git://git.kernel.org/.../jeyu/lin=
ux
      Merge branch 'for-linus' of git://git.kernel.org/.../dtor/input
      Merge tag 'scsi-fixes' of git://git.kernel.org/.../jejb/scsi
      Merge tag 'dax-fix-5.4-rc5' of git://git.kernel.org/.../nvdimm/nvdimm
      Merge tag 'dma-mapping-5.4-2' of git://git.infradead.org/users/hch/dm=
a-mapping
      Merge tag 'for-linus-5.4-rc5-tag' of git://git.kernel.org/.../xen/tip
      Merge tag 's390-5.4-5' of git://git.kernel.org/.../s390/linux
      Merge tag 'for-linus-2019-10-26' of git://git.kernel.dk/linux-block
      Merge branch 'i2c/for-current-fixed' of git://git.kernel.org/.../wsa/=
linux
      Merge tag 'usb-5.4-rc5' of git://git.kernel.org/.../gregkh/usb
      Merge tag 'char-misc-5.4-rc5' of git://git.kernel.org/.../gregkh/char=
-misc
      Merge tag 'driver-core-5.4-rc5' of git://git.kernel.org/.../gregkh/dr=
iver-core
      Merge tag 'staging-5.4-rc5' of git://git.kernel.org/.../gregkh/staging
      Merge tag 'tty-5.4-rc5' of git://git.kernel.org/.../gregkh/tty
      Merge tag 'mips_fixes_5.4_3' of git://git.kernel.org/.../mips/linux
      Merge tag 'riscv/for-v5.4-rc5-b' of git://git.kernel.org/.../riscv/li=
nux
      Merge tag '5.4-rc5-smb3-fixes' of git://git.samba.org/sfrench/cifs-2.6
      Merge branch 'irq-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'timers-urgent-for-linus' of git://git.kernel.org/.../ti=
p/tip
      Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Linux 5.4-rc5
      Merge tag 'for_linus' of git://git.kernel.org/.../mst/vhost
      Merge branch 'for-linus' of git://git.kernel.org/.../hid/hid
      Merge tag 'arc-5.4-rc6' of git://git.kernel.org/.../vgupta/arc
      Merge tag 'fuse-fixes-5.4-rc6' of git://git.kernel.org/.../mszeredi/f=
use
      Merge tag 'gfs2-v5.4-rc5.fixes' of git://git.kernel.org/.../gfs2/linu=
x-gfs2
      Merge tag 'iommu-fixes-v5.4-rc5' of git://git.kernel.org/.../joro/iom=
mu
      Merge tag 'dmaengine-fix-5.4-rc6' of git://git.infradead.org/users/vk=
oul/slave-dma
      Merge tag 'sound-5.4-rc6' of git://git.kernel.org/.../tiwai/sound
      Merge tag 'for-linus' of git://git.kernel.org/.../rdma/rdma
      Merge tag 'pm-5.4-rc6' of git://git.kernel.org/.../rafael/linux-pm
      Merge tag 'drm-fixes-2019-11-01' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
      Merge tag 'arm64-fixes' of git://git.kernel.org/.../arm64/linux
      Merge branch 'efi-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'sched-urgent-for-linus' of git://git.kernel.org/.../tip=
/tip
      Merge branch 'parisc-5.4-3' of git://git.kernel.org/.../deller/parisc=
-linux
      Merge tag 'riscv/for-v5.4-rc6' of git://git.kernel.org/.../riscv/linux
      Merge tag 'for-linus-20191101' of git://git.kernel.dk/linux-block
      Merge tag 'nfs-for-5.4-3' of git://git.linux-nfs.org/projects/anna/li=
nux-nfs
      Merge git://git.kernel.org/.../netdev/net
      Merge tag 's390-5.4-6' of git://git.kernel.org/.../s390/linux
      Merge tag 'powerpc-5.4-4' of git://git.kernel.org/.../powerpc/linux
      Merge tag 'scsi-fixes' of git://git.kernel.org/.../jejb/scsi
      Merge tag 'pwm/for-5.4-rc6' of git://git.kernel.org/.../thierry.redin=
g/linux-pwm
      Merge tag 'hwmon-for-v5.4-rc6' of git://git.kernel.org/.../groeck/lin=
ux-staging
      Merge tag '5.4-rc6-smb3-fix' of git://git.samba.org/sfrench/cifs-2.6
      Merge tag 'usb-5.4-rc6' of git://git.kernel.org/.../gregkh/usb
      Linux 5.4-rc6
      Merge tag 'gpio-v5.4-4' of git://git.kernel.org/.../linusw/linux-gpio
      Merge tag 'for-linus-2019-11-05' of git://git.kernel.org/.../brauner/=
linux
      Merge branch 'akpm' (patches from Andrew)
      Merge branch 'for-linus' of git://git.kernel.org/.../hid/hid
      Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/.../clk/linux
      Merge tag 'drm-fixes-2019-11-08' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'sound-5.4-rc7' of git://git.kernel.org/.../tiwai/sound
      Merge tag 'pm-5.4-rc7' of git://git.kernel.org/.../rafael/linux-pm
      Merge tag 'xarray-5.4' of git://git.infradead.org/users/willy/linux-d=
ax
      Merge tag 'arm64-fixes' of git://git.kernel.org/.../arm64/linux
      Merge tag 'modules-for-v5.4-rc7' of git://git.kernel.org/.../jeyu/lin=
ux
      Merge tag 'ceph-for-5.4-rc7' of git://github.com/ceph/ceph-client
      Merge tag 'pwm/for-5.4-rc7' of git://git.kernel.org/.../thierry.redin=
g/linux-pwm
      Merge tag 'for-linus-2019-11-08' of git://git.kernel.dk/linux-block
      Merge git://git.kernel.org/.../netdev/net
      Merge tag 'linux-watchdog-5.4-rc7' of git://www.linux-watchdog.org/li=
nux-watchdog
      Merge tag 'for-5.4-rc6-tag' of git://git.kernel.org/.../kdave/linux
      Merge tag 'pinctrl-v5.4-3' of git://git.kernel.org/.../linusw/linux-p=
inctrl
      Merge tag '5.4-rc7-smb3-fix' of git://git.samba.org/sfrench/cifs-2.6
      Merge branch 'core-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'irq-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'sched-urgent-for-linus' of git://git.kernel.org/.../tip=
/tip
      Merge branch 'timers-urgent-for-linus' of git://git.kernel.org/.../ti=
p/tip
      Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge tag 'configfs-for-5.4-2' of git://git.infradead.org/users/hch/c=
onfigfs
      Merge tag 'char-misc-5.4-rc7' of git://git.kernel.org/.../gregkh/char=
-misc
      Merge tag 'staging-5.4-rc7' of git://git.kernel.org/.../gregkh/staging
      Merge tag 'armsoc-fixes' of git://git.kernel.org/.../soc/soc
      Linux 5.4-rc7
      Merge tag 'scsi-fixes' of git://git.kernel.org/.../jejb/scsi
      Merge branch 'for-5.4-fixes' of git://git.kernel.org/.../tj/cgroup
      Merge Intel Gen8/Gen9 graphics fixes from Jon Bloomfield.
      Merge branch 'x86-pti-for-linus' of git://git.kernel.org/.../tip/tip
      Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
      Remove VirtualBox guest shared folders filesystem
      Merge tag 'for-5.4-rc7-tag' of git://git.kernel.org/.../kdave/linux
      Merge branch 'for-linus' of git://git.kernel.org/.../dtor/input
      Merge tag 'for-linus' of git://git.kernel.org/.../rdma/rdma
      Merge tag 'kbuild-fixes-v5.4-3' of git://git.kernel.org/.../masahiroy=
/linux-kbuild
      Merge branch 'fixes' of git://git.kernel.org/.../viro/vfs
      Merge tag 'drm-fixes-2019-11-15' of git://anongit.freedesktop.org/drm=
/drm
      Merge tag 'sound-5.4-rc8' of git://git.kernel.org/.../tiwai/sound
      Merge tag 'mmc-v5.4-rc7' of git://git.kernel.org/.../ulfh/mmc
      Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
      Merge tag 'mips_fixes_5.4_4' of git://git.kernel.org/.../mips/linux
      Merge tag 'arm64-fixes' of git://git.kernel.org/.../arm64/linux
      Merge tag 'ceph-for-5.4-rc8' of git://github.com/ceph/ceph-client
      Merge tag 'for-linus-20191115' of git://git.kernel.dk/linux-block
      Merge branch 'for-linus' of git://git.kernel.org/.../dtor/input
      Merge branch 'akpm' (patches from Andrew)
      Merge git://git.kernel.org/.../netdev/net
      Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/.../tip/=
tip
      Merge branch 'timers-urgent-for-linus' of git://git.kernel.org/.../ti=
p/tip
      Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/.../tip/t=
ip
      Merge branch 'linus' of git://git.kernel.org/.../herbert/crypto-2.6
      Merge branch 'i2c/for-current' of git://git.kernel.org/.../wsa/linux
      Merge branch 'sched-urgent-for-linus' of git://git.kernel.org/.../tip=
/tip
      Merge tag 'iommu-fixes-v5.4-rc7' of git://git.kernel.org/.../joro/iom=
mu
      Linux 5.4-rc8

Linus Walleij (8):
      Merge tag 'gpio-v5.4-rc2-fixes-for-linus' of git://git.kernel.org/...=
/brgl/linux into fixes
      pinctrl: bcm-iproc: Use SPDX header
      Merge tag 'intel-pinctrl-fixes-v5.4' of git://git.kernel.org/.../pinc=
trl/intel into fixes
      Merge tag 'gpio-v5.4-rc5-fixes-for-linus' of git://git.kernel.org/...=
/brgl/linux into fixes
      Merge tag 'intel-pinctrl-fixes-v5.4-2' of git://git.kernel.org/.../pi=
nctrl/intel into fixes
      Revert "gpio: merrifield: Move hardware initialization to callback"
      Revert "gpio: merrifield: Restore use of irq_base"
      Revert "gpio: merrifield: Pass irqchip when adding gpiochip"

Liran Alon (2):
      KVM: VMX: Remove specialized handling of unexpected exit-reasons
      KVM: VMX: Fix comment to specify PID.ON instead of PIR.ON

Liu Xiang (1):
      iommu/arm-smmu: Free context bitmap in the err path of arm_smmu_init_=
domain_context

Lorenzo Bianconi (4):
      iio: imu: st_lsm6dsx: forbid 0 sensor sensitivity
      iio: imu: st_lsm6dsx: fix waitime for st_lsm6dsx i2c controller
      mt76: mt76x2e: disable pcie_aspm by default
      mt76: dma: fix buffer unmap with non-linear skbs

Lu Baolu (1):
      MAINTAINERS: Update for INTEL IOMMU (VT-d) entry

Luc Van Oostenryck (1):
      kbuild: tell sparse about the $ARCH

Luca Coelho (9):
      iwlwifi: don't access trans_cfg via cfg
      iwlwifi: fix ACPI table revision checks
      iwlwifi: exclude GEO SAR support for 3168
      iwlwifi: pcie: change qu with jf devices to use qu configuration
      iwlwifi: pcie: fix merge damage on making QnJ exclusive
      iwlwifi: pcie: fix PCI ID 0x2720 configs that should be soc
      iwlwifi: pcie: fix all 9460 entries for qnj
      iwlwifi: pcie: add workaround for power gating in integrated 22000
      iwlwifi: pcie: 0x2720 is qu and 0x30DC is not

Lucas Stach (7):
      arm64: dts: zii-ultra: fix ARM regulator states
      drm/etnaviv: fix deadlock in GPU coredump
      drm/etnaviv: reinstate MMUv1 command buffer window check
      arm64: dts: zii-ultra: fix ARM regulator GPIO handle
      Input: synaptics-rmi4 - fix video buffer size
      Input: synaptics-rmi4 - clear IRQ enables for F54
      ASoC: tlv320aic31xx: configure output common-mode voltage

Luis Henriques (2):
      ceph: fix use-after-free in __ceph_remove_cap()
      ceph: don't allow copy_file_range when stripe_count !=3D 1

Lukas Wunner (2):
      efi/cper: Fix endianness of PCIe class code
      netfilter: nf_tables: Align nft_expr private data to 64-bit

Lukas Zapletal (1):
      hwmon: (k10temp) Update documentation and add temp2_input info

Lyude Paul (2):
      igb/igc: Don't warn on fatal read failures when the device is removed
      Input: synaptics - enable RMI mode for X1 Extreme 2nd Generation

Magnus Karlsson (4):
      xsk: Fix crash in poll when device does not support ndo_xsk_wakeup
      xsk: Fix registration of Rx-only sockets
      i40e: need_wakeup flag might not be set for Tx
      ixgbe: need_wakeup flag might not be set for Tx

Mahesh Bandewar (2):
      blackhole_netdev: fix syzkaller reported issue
      Revert "blackhole_netdev: fix syzkaller reported issue"

Manfred Rudigier (2):
      igb: Enable media autosense for the i350.
      igb: Fix constant media auto sense switching when no cable is connect=
ed

Manish Chopra (1):
      qede: fix NULL pointer deref in __qede_remove()

Mans Rullgard (1):
      net: ethernet: dwmac-sun8i: show message only when switching to promi=
sc

Mao Wenan (1):
      usbip: vhci_hcd indicate failed message

Maor Gottlieb (1):
      net/mlx5e: Replace kfree with kvfree when free vhca stats

Marc Kleine-Budde (8):
      can: rx-offload: can_rx_offload_queue_sorted(): fix error handling, a=
void skb mem leak
      can: rx-offload: can_rx_offload_queue_tail(): fix error handling, avo=
id skb mem leak
      can: rx-offload: can_rx_offload_offload_one(): do not increase the sk=
b_queue beyond skb_queue_len_max
      can: rx-offload: can_rx_offload_offload_one(): increment rx_fifo_erro=
rs on queue overflow or OOM
      can: rx-offload: can_rx_offload_offload_one(): use ERR_PTR() to propa=
gate error value in case of errors
      can: rx-offload: can_rx_offload_irq_offload_fifo(): continue on error
      can: flexcan: increase error counters if skb enqueueing via can_rx_of=
fload_queue_sorted() fails
      can: ti_hecc: ti_hecc_error(): increase error counters if skb enqueue=
ing via can_rx_offload_queue_sorted() fails

Marc Zyngier (11):
      irqchip/sifive-plic: Switch to fasteoi flow
      arm64: KVM: Trap VM ops when ARM64_WORKAROUND_CAVIUM_TX2_219_TVM is s=
et
      arm64: Enable workaround for Cavium TX2 erratum 219 when running SMT
      arm64: Avoid Cavium TX2 erratum 219 when switching TTBR
      arm64: Allow CAVIUM_TX2_ERRATUM_219 to be selected
      KVM: arm64: pmu: Fix cycle counter truncation
      arm64: KVM: Handle PMCR_EL0.LC as RES1 on pure AArch64 systems
      KVM: arm64: pmu: Set the CHAINED attribute before creating the in-ker=
nel event
      KVM: arm64: pmu: Reset sample period on overflow handling
      KVM: Forbid /dev/kvm being opened by a compat task when CONFIG_KVM_CO=
MPAT=3Dn
      KVM: Add a comment describing the /dev/kvm no_compat handling

Marco Felsch (8):
      regulator: of: fix suspend-min/max-voltage parsing
      regulator: core: make regulator_register() EPROBE_DEFER aware
      regulator: da9062: fix suspend_enable/disable preparation
      gpio: fix getting nonexclusive gpiods from DT
      Input: da9063 - fix capability and drop KEY_SLEEP
      iio: light: fix vcnl4000 devicetree hooks
      iio: light: add missing vcnl4040 of_compatible
      iio: adc: ad799x: fix probe error handling

Marek Beh=C3=BAn (1):
      arm64: dts: armada-3720-turris-mox: convert usb-phy to phy-supply

Marek Szyprowski (4):
      opp: core: Revert "add regulators enable and disable"
      clk: samsung: exynos5433: Fix error paths
      clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU
      clk: samsung: exynos5420: Preserve PLL configuration during suspend/r=
esume

Marek Vasut (4):
      net: dsa: microchip: Do not reinit mutexes on KSZ87xx
      net: dsa: microchip: Add shared regmap mutex
      net: phy: micrel: Discern KSZ8051 and KSZ8795 PHYs
      net: phy: micrel: Update KSZ87xx PHY name

Mario Limonciello (1):
      ACPI: PM: Drop Dell XPS13 9360 from LPS0 Idle _DSM blacklist

Mark Brown (4):
      ata: libahci_platform: Fix regulator_get_optional() misuse
      ASoC: SOF: Intel: Fix build break
      Merge branch 'asoc-5.4' into asoc-linus
      Merge branch 'asoc-5.5' into asoc-next

Mark Rutland (4):
      arm64: mm: avoid virt_to_phys(init_mm.pgd)
      arm64: mm: fix spurious fault detection
      arm64: mm: fix inverted PAR_EL1.F check
      stop_machine: Avoid potential race behaviour

Mark Zhang (1):
      RDMA/nldev: Skip counter if port doesn't match

MarkLee (2):
      net: ethernet: mediatek: Fix MT7629 missing GMII mode support
      arm: dts: mediatek: Update mt7629 dts to reflect the latest dt-binding

Markus Theil (1):
      nl80211: fix validation of mesh path nexthop

Martin Blumenstingl (1):
      clk: meson: gxbb: let sar_adc_clk_div set the parent clock rate

Martin Fuzzey (1):
      net: phy: smsc: LAN8740: add PHY_RST_AFTER_CLK_EN flag

Martin Wilck (1):
      scsi: qla2xxx: fix NPIV tear down process

Marvin Liu (1):
      virtio_ring: fix stalls for packed rings

Masahiro Yamada (10):
      module: swap the order of symbol.namespace
      modpost: fix broken sym->namespace for external module builds
      module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol confli=
ct
      kbuild: fix build error of 'make nsdeps' in clean tree
      nsdeps: fix hashbang of scripts/nsdeps
      nsdeps: make generated patches independent of locale
      doc: move namespaces.rst from kbuild/ to core-api/
      ARM: 8908/1: add __always_inline to functions called from __get_user_=
check()
      kbuild: update comment about KBUILD_ALLDIRS
      sparc: vdso: fix build error of vdso32

Masanari Iida (1):
      staging: exfat: Fix a typo in Kconfig

Masashi Honma (1):
      nl80211: Disallow setting of HT for channel 14

Masayoshi Mizuma (1):
      arm64/sve: Fix wrong free for task->thread.sve_state

Mathias Nyman (5):
      xhci: Fix false warning message about wrong bounce buffer write length
      xhci: Prevent device initiated U1/U2 link pm if exit latency is too l=
ong
      xhci: Fix USB 3.1 capability detection on early xHCI 1.1 spec based h=
osts
      xhci: Fix NULL pointer dereference in xhci_clear_tt_buffer_complete()
      xhci: Fix use-after-free regression in xhci clear hub TT implementati=
on

Matt Bennett (1):
      tipc: add back tipc prefix to log messages

Matt Roper (3):
      drm/i915/cml: Add second PCH ID for CMP
      Revert "drm/i915/ehl: Update MOCS table for EHL"
      drm/i915/tgl: MOCS table update

Matthew Wilcox (Oracle) (5):
      XArray: Fix xas_next() with a single entry at 0
      idr: Fix idr_get_next_ul race with idr_remove
      radix tree: Remove radix_tree_iter_find
      idr: Fix integer overflow in idr_for_each_entry
      idr: Fix idr_alloc_u32 on 32-bit systems

Matthias Maennich (3):
      modpost: delegate updating namespaces to separate function
      modpost: make updating the symbol namespace explicit
      symbol namespaces: revert to previous __ksymtab name scheme

Matti Vaittinen (1):
      watchdog: bd70528: Add MODULE_ALIAS to allow module auto loading

Mauro Carvalho Chehab (1):
      bindings: rename links to mason USB2/USB3 DT files

Max Filippov (5):
      xtensa: clean up assembly arguments in uaccess macros
      xtensa: fix type conversion in __get_user_[no]check
      xtensa: drop EXPORT_SYMBOL for outs*/ins*
      xtensa: virt: fix PCI IO ports mapping
      xtensa: fix change_bit in exclusive access option

Max Gurtovoy (3):
      nvmet-loop: fix possible leakage during error flow
      nvme-tcp: fix possible leakage during error flow
      nvme-rdma: fix a segmentation fault during module unload

Max Reitz (1):
      xfs: Fix tail rounding in xfs_alloc_file_space()

Maxim Mikityanskiy (1):
      net/mlx5e: Fix handling of compressed CQEs in case of low NAPI budget

Maxime Ripard (4):
      ARM: dts: sunxi: Revert phy-names removal for ECHI and OHCI
      dt-bindings: usb: Bring back phy-names
      dt-bindings: media: sun4i-csi: Drop the module clock
      ARM: dts: sun7i: Drop the module clock from the device tree

Mel Gorman (1):
      mm, meminit: recalculate pcpu batch and high limits after init comple=
tes

Miaohe Lin (1):
      KVM: SVM: Fix potential wrong physical id in avic_handle_ldr_update

Miaoqing Pan (1):
      ath10k: fix latency issue for QCA988x

Michael Chan (1):
      bnxt_en: Fix devlink NVRAM related byte order related issues.

Michael Ellerman (1):
      usercopy: Avoid soft lockups in test_check_nonzero_user()

Michael S. Tsirkin (3):
      tools/virtio: more stubs
      tools/virtio: xen stub
      vhost/test: stop device before reset

Michael Schmitz (1):
      scsi: core: Handle drivers which set sg_tablesize to zero

Michael Straube (1):
      staging: exfat: add missing SPDX line to Kconfig

Michael Strauss (1):
      drm/amd/display: Passive DP->HDMI dongle detection fix

Michael Tretter (1):
      macb: propagate errors when getting optional clocks

Michael Vassernis (1):
      mac80211_hwsim: fix incorrect dev_alloc_name failure goto

Michael Walle (2):
      ASoC: wm8904: configure sysclk/FLL automatically
      ASoC: wm8904: fix regcache handling

Michael Zhivich (1):
      x86/tsc: Respect tsc command line paraemeter for clocksource_tsc_early

Michal Hocko (4):
      kernel/sysctl.c: do not override max_threads provided by userspace
      x86/tsx: Add config options to set tsx=3Don|off|auto
      mm, vmstat: hide /proc/pagetypeinfo from normal users
      mm, vmstat: reduce zone->lock holding time by /proc/pagetypeinfo

Michal Kalderon (1):
      RDMA/core: Fix use after free and refcnt leak on ndev in_device in iw=
arp_query_port

Michal Simek (1):
      serial: uartps: Fix uartps_major handling

Michal Suchanek (2):
      soundwire: depend on ACPI
      soundwire: depend on ACPI || OF

Micha=C5=82 Miros=C5=82aw (1):
      HID: fix error message in hid_open_report()

Mihail Atanassov (2):
      drm/komeda: Don't flush inactive pipes
      drm/komeda: Fix typos in komeda_splitter_validate

Mika Westerberg (5):
      bdi: Do not use freezable workqueue
      Revert "libata, freezer: avoid block device removal while system is f=
rozen"
      thunderbolt: Read DP IN adapter first two dwords in one go
      thunderbolt: Fix lockdep circular locking depedency warning
      thunderbolt: Drop unnecessary read when writing LC command in Ice Lake

Mike Christie (1):
      nbd: verify socket is supported during setup

Mike Marciniszyn (1):
      IB/hfi1: Use a common pad buffer for 9B and 16B packets

Mike Rapoport (1):
      mm: memblock: do not enforce current limit for memblock_phys* family

Miklos Szeredi (5):
      virtio-fs: don't show mount options
      fuse: don't dereference req->args on finished request
      fuse: don't advise readdirplus for negative lookup
      fuse: flush dirty data/metadata before non-truncate setattr
      fuse: truncate pending writes on O_TRUNC

Mikulas Patocka (3):
      dm snapshot: introduce account_start_copy() and account_end_copy()
      dm snapshot: rework COW throttling to fix deadlock
      dm cache: fix bugs when a GFP_NOWAIT allocation fails

Mohamad Heib (1):
      IB/core: Fix wrong iterating on ports

Mordechay Goodstein (1):
      iwlwifi: pcie: don't consider IV len in A-MSDU

Naftali Goldstein (1):
      iwlwifi: mvm: fix race in sync rx queue notification

Narendra K (1):
      efi: Make CONFIG_EFI_RCI2_TABLE selectable on x86 only

Nathan Chancellor (1):
      clk: sunxi: Fix operator precedence in sunxi_divs_clk_setup

Navid Emamdoost (17):
      RDMA/hfi1: Prevent memory leak in sdma_init
      Staging: fbtft: fix memory leak in fbtft_framebuffer_alloc
      misc: fastrpc: prevent memory leak in fastrpc_dma_buf_attach
      staging: vt6655: Fix memory leak in vt6655_probe
      nl80211: fix memory leak in nl80211_get_ftm_responder_stats
      iwlwifi: dbg_ini: fix memory leak in alloc_sgtable
      iwlwifi: pcie: fix memory leaks in iwl_pcie_ctxt_info_gen3_init
      iio: imu: adis16400: release allocated memory on failure
      iio: imu: adis16400: fix memory leak
      virt: vbox: fix memory leak in hgcm_call_preprocess_linaddr
      net/mlx5: prevent memory leak in mlx5_fpga_conn_create_cq
      net/mlx5: fix memory leak in mlx5_fw_fatal_reporter_dump
      drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
      of: unittest: fix memory leak in unittest_data_add
      usb: dwc3: pci: prevent memory leak in dwc3_pci_probe
      wimax: i2400: Fix memory leak in i2400m_op_rfkill_sw_toggle
      can: gs_usb: gs_can_open(): prevent memory leak

Nayna Jain (1):
      sysfs: Fixes __BIN_ATTR_WO() macro

Neil Armstrong (2):
      clk: meson: g12a: fix cpu clock rate setting
      clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes

Nicholas Nunley (1):
      iavf: initialize ITRN registers with correct values

Nicholas Piggin (2):
      scsi: qla2xxx: stop timer in shutdown path
      powerpc/powernv: Fix CPU idle to be called with IRQs disabled

Nick Desaulniers (4):
      parisc: prefer __section from compiler_attributes.h
      drm/amdgpu: fix stack alignment ABI mismatch for Clang
      drm/amdgpu: fix stack alignment ABI mismatch for GCC 7.1+
      drm/amdgpu: enable -msse2 for GCC 7.1+ users

Nicolas Boichat (1):
      HID: google: add magnemite/masterball USB ids

Nicolas Dichtel (1):
      netns: fix NLM_F_ECHO mechanism for RTM_NEWNSID

Nicolas Saenz Julienne (1):
      mmc: sdhci-iproc: fix spurious interrupts on Multiblock reads with bc=
m2711

Nicolin Chen (1):
      hwmon: (ina3221) Fix read timeout issue

Nikhil Badola (1):
      usb: fsl: Check memory resource before releasing it

Nikolay Aleksandrov (1):
      net: rtnetlink: fix a typo fbd -> fdb

Nilkanth Ahirrao (1):
      ASoC: rsnd: fix DALIGN register for SSIU

Nirmoy Das (1):
      drm/amdgpu: fix memory leak

Nishad Kamdar (9):
      x86: Use the correct SPDX License Identifier in headers
      net: dsa: microchip: Use the correct style for SPDX License Identifier
      net: cavium: Use the correct style for SPDX License Identifier
      net: dsa: sja1105: Use the correct style for SPDX License Identifier
      net: ethernet: Use the correct style for SPDX License Identifier
      net: dpaa2: Use the correct style for SPDX License Identifier
      net: hns3: Use the correct style for SPDX License Identifier
      octeontx2-af: Use the correct style for SPDX License Identifier
      net: stmmac: Use the correct style for SPDX License Identifier

Noralf Tr=C3=B8nnes (3):
      staging/fbtft: Depend on OF
      staging/fbtft: Remove fbtft_device
      staging/fbtft: Remove flexfb

Nuno S=C3=A1 (1):
      hwmon: Fix HWMON_P_MIN_ALARM mask

Okash Khawaja (1):
      staging: speakup: document sysfs attributes

Oleg Nesterov (1):
      cgroup: freezer: call cgroup_enter_frozen() with preemption disabled =
in ptrace_stop()

Oleksij Rempel (12):
      can: j1939: fix memory leak if filters was set
      can: j1939: transport: j1939_session_fresh_new(): make sure EOMA is s=
end with the total message size set
      can: j1939: transport: j1939_xtp_rx_eoma_one(): Add sanity check for =
correct total message size
      can: af_can: export can_sock_destruct()
      can: j1939: move j1939_priv_put() into sk_destruct callback
      can: j1939: main: j1939_ndev_to_priv(): avoid crash if can_ml_priv is=
 NULL
      can: j1939: socket: rework socket locking for j1939_sk_release() and =
j1939_sk_sendmsg()
      can: j1939: transport: make sure the aborted session will be deactiva=
ted only once
      can: j1939: make sure socket is held as long as session exists
      can: j1939: transport: j1939_cancel_active_session(): use hrtimer_try=
_to_cancel() instead of hrtimer_cancel()
      can: j1939: j1939_can_recv(): add priv refcounting
      can: j1939: warn if resources are still linked on destroy

Oliver Neukum (5):
      scsi: sd: Ignore a failure to sync cache due to lack of authorization
      usb: hso: obey DMA rules in tiocmget
      CDC-NCM: handle incomplete transfer of MTU
      Input: ff-memless - kill timer in destroy()
      ax88172a: fix information leak on short answers

Olof Johansson (16):
      Merge tag 'mvebu-fixes-5.4-1' of git://git.infradead.org/linux-mvebu =
into arm/fixes
      Merge tag 'arm-soc/for-5.4/devicetree-arm64-fixes' of https://github.=
com/Broadcom/stblinux into arm/fixes
      Merge tag 'omap-for-v5.4/fixes-rc3-signed' of git://git.kernel.org/..=
=2E/tmlind/linux-omap into arm/fixes
      Merge tag 'imx-fixes-5.4' of git://git.kernel.org/.../shawnguo/linux =
into arm/fixes
      Merge tag 'v5.4-rockchip-dtsfixes1' of git://git.kernel.org/.../mmind=
/linux-rockchip into arm/fixes
      Merge tag 'davinci-fixes-for-v5.4' of git://git.kernel.org/.../nsekha=
r/linux-davinci into arm/fixes
      Merge tag 'arm-soc/for-5.4/devicetree-fixes' of https://github.com/Br=
oadcom/stblinux into arm/fixes
      Merge tag 'arm-soc/for-5.4/devicetree-fixes-part2' of https://github.=
com/Broadcom/stblinux into arm/fixes
      Merge tag 'sunxi-fixes-for-5.4-1' of https://git.kernel.org/.../sunxi=
/linux into arm/fixes
      Merge tag 'omap-for-v5.4/fixes-rc4-signed' of git://git.kernel.org/..=
=2E/tmlind/linux-omap into arm/fixes
      Merge tag 'arm-soc/for-5.5/maintainers' of https://github.com/Broadco=
m/stblinux into arm/fixes
      Merge tag 'reset-fixes-for-v5.5' of git://git.pengutronix.de/git/pza/=
linux into arm/fixes
      Merge tag 'imx-fixes-5.4-2' of git://git.kernel.org/.../shawnguo/linu=
x into arm/fixes
      Merge tag 'sunxi-fixes-for-5.4-2' of https://git.kernel.org/.../sunxi=
/linux into arm/fixes
      Merge tag 'imx-fixes-5.4-3' of git://git.kernel.org/.../shawnguo/linu=
x into arm/fixes
      Merge tag 'stm32-dt-for-v5.4-fixes-2' of git://git.kernel.org/.../ato=
rgue/stm32 into arm/fixes

Ondrej Jirman (2):
      ARM: dts: sun8i-a83t-tbs-a711: Fix WiFi resume from suspend
      ARM: sunxi: Fix CPU powerdown on A83T

Ondrej Mosnacek (1):
      selinux: fix context string corruption in convert_context()

Pablo Neira Ayuso (7):
      netfilter: nf_flow_table: set timeout before insertion into hashes
      netfilter: nf_tables_offload: restore basechain deletion
      Merge tag 'ipvs-fixes-for-v5.4' of https://git.kernel.org/.../horms/i=
pvs
      netfilter: nf_tables_offload: check for register data length mismatch=
es
      netfilter: nf_tables: bogus EOPNOTSUPP on basechain update
      netfilter: nf_tables_offload: skip EBUSY on chain update
      Merge branch 'master' of git://blackhole.kfki.hu/nf

Palmer Dabbelt (1):
      MAINTAINERS: Change to my personal email address

Pan Bian (5):
      NFC: fdp: fix incorrect free object
      NFC: st21nfca: fix double free
      nfc: netlink: fix double device reference drop
      drm/i915/gvt: fix dropping obj reference twice
      Input: cyttsp4_core - fix use after free bug

Paolo Abeni (2):
      ipv4: fix route update on metric change.
      selftests: fib_tests: add more tests for metric update

Paolo Bonzini (8):
      kvm: clear kvmclock MSR on reset
      Merge tag 'kvmarm-fixes-5.4-2' of git://git.kernel.org/.../kvmarm/kvm=
arm into HEAD
      Merge tag 'kvm-ppc-fixes-5.4-1' of git://git.kernel.org/.../paulus/po=
werpc into HEAD
      KVM: vmx, svm: always run with EFER.NXE=3D1 when shadow paging is act=
ive
      kvm: mmu: ITLB_MULTIHIT mitigation
      KVM: Fix NULL-ptr deref after kvm_create_vm fails
      KVM: fix placement of refcount initialization
      kvm: x86: disable shattered huge page recovery for PREEMPT_RT.

Paolo Valente (1):
      block, bfq: deschedule empty bfq_queues not referred by any process

Parav Pandit (3):
      IB/core: Use rdma_read_gid_l2_fields to compare GID L2 fields
      IB/core: Avoid deadlock during netlink message handling
      net/mlx5: Fix rtable reference leak

Pascal Bouwmann (1):
      iio: fix center temperature of bmc150-accel-core

Patrice Chotard (2):
      ARM: dts: stm32: relax qspi pins slew-rate for stm32mp157
      ARM: dts: stm32: relax qspi pins slew-rate for stm32mp157

Patrick Williams (2):
      pinctrl: armada-37xx: fix control of pins 32 and up
      pinctrl: armada-37xx: swap polarity on LED group

Paul Burton (4):
      mtd: rawnand: au1550nd: Fix au_read_buf16() prototype
      MIPS: Disable Loongson MMI instructions for kernel build
      MAINTAINERS: Use @kernel.org address for Paul Burton
      MIPS: tlbex: Fix build_restore_pagemask KScratch restore

Paul Walmsley (8):
      riscv: dts: HiFive Unleashed: add default chosen/stdout-path
      riscv: tlbflush: remove confusing comment on local_flush_tlb_all()
      riscv: add prototypes for assembly language functions from head.S
      riscv: init: merge split string literals in preprocessor directive
      riscv: mark some code and data as file-static
      riscv: add missing header file includes
      riscv: fp: add missing __user pointer annotations
      riscv: for C functions called only from assembly, mark with __visible

Paulo Alcantara (SUSE) (1):
      cifs: Handle -EINPROGRESS only when noblockcnt is set

Pavel Begunkov (7):
      io_uring: fix reversed nonblock flag for link submission
      io_uring: remove wait loop spurious wakeups
      io_uring: Fix corrupted user_data
      io_uring: Fix broken links with offloading
      io_uring: Fix race for sqes with userspace
      io_uring: Fix leaked shadow_req
      io_uring: Fix getting file for timeout

Pavel Machek (1):
      Add my linux-leds branch to MAINTAINERS

Pavel Shilovsky (6):
      CIFS: Gracefully handle QueryInfo errors during open
      CIFS: Force revalidate inode when dentry is stale
      CIFS: Force reval dentry if LOOKUP_REVAL flag is set
      CIFS: Fix retry mid list corruption on reconnects
      CIFS: Fix use after free of file info structures
      SMB3: Fix persistent handles reconnect

Pavel Tatashin (1):
      arm64: hibernate: check pgd table allocation

Pawan Gupta (9):
      x86/msr: Add the IA32_TSX_CTRL MSR
      x86/cpu: Add a helper function x86_read_arch_cap_msr()
      x86/cpu: Add a "tsx=3D" cmdline option with TSX disabled by default
      x86/speculation/taa: Add mitigation for TSX Async Abort
      x86/speculation/taa: Add sysfs reporting for TSX Async Abort
      kvm/x86: Export MDS_NO=3D0 to guests when TSX is enabled
      x86/tsx: Add "auto" option to the tsx=3D cmdline parameter
      x86/speculation/taa: Add documentation for TSX Async Abort
      x86/cpu: Add Tremont to the cpu vulnerability whitelist

Pawel Harlozinski (1):
      ASoC: Jack: Fix NULL pointer dereference in snd_soc_jack_report

Pawel Laszczak (4):
      usb: cdns3: Fix sheduling with locks held.
      usb:cdns3: Fix for CV CH9 running with g_zero driver.
      usb: cdns3: Fix for incorrect DMA mask.
      usb: cdns3: Fix dequeue implementation.

Pelle van Gils (1):
      drm/amdgpu/powerplay/vega10: allow undervolting in p7

Peter Chen (1):
      usb: gadget: configfs: fix concurrent issue between composite APIs

Peter Jones (2):
      efi/tpm: Don't access event->count when it isn't mapped
      efi/tpm: Don't traverse an event log with no events

Peter Ujfalusi (8):
      ARM: davinci: dm365: Fix McBSP dma_slave_map entry
      clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
      ASoC: dmaengine: Use dma_request_chan() directly for channel request
      ASoC: ti: davinci-mcasp: Use dma_request_chan() directly for channel =
request
      ASoC: pcm3168a: Document optional RST gpio
      ASoC: pcm3168a: Add support for optional RST gpio handling
      ASoC: dt-bindings: pcm3168a: Update the optional RST gpio for clarity
      ASoC: pcm3168a: Update the RST gpio handling to align with documentat=
ion

Peter Zijlstra (3):
      sched: Fix pick_next_task() vs 'change' pattern race
      sched/core: Avoid spurious lock dependencies
      perf/core: Disallow uncore-cgroup events

Petr Mladek (1):
      tracing: Initialize iter->seq after zeroing in tracing_read_pipe()

Philip Yang (1):
      drm/amdgpu: user pages array memory leak fix

Philipp Zabel (4):
      reset: fix of_reset_simple_xlate kerneldoc comment
      reset: fix of_reset_control_get_count kerneldoc comment
      reset: fix reset_control_lookup kerneldoc comment
      reset: fix reset_control_get_exclusive kerneldoc comment

Philippe Schenker (1):
      dt-bindings: fixed-regulator: fix compatible enum

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu/sdma5: do not execute 0-sized IBs (v2)

Pierre-Louis Bossart (3):
      soundwire: slave: fix scanf format
      ASoC: Intel: acpi-match: split CNL tables in three
      ASoC: SOF: Intel: hda: use fallback for firmware name

Potnuri Bharat Teja (3):
      RDMA/iw_cxgb4: fix SRQ access from dump_qp()
      iw_cxgb4: fix ECN check on the passive accept
      RDMA/iw_cxgb4: Avoid freeing skb twice in arp failure case

Pragnesh Patel (1):
      media: dt-bindings: Fix building error for dt_binding_check

Prateek Sood (1):
      tracing: Fix race in perf_trace_buf initialization

Qais Yousef (2):
      sched/core: Fix compilation error when cgroup not selected
      sched/uclamp: Fix incorrect condition

Qian Cai (3):
      mm/page_alloc.c: fix a crash in free_pages_prepare()
      mm/slub: fix a deadlock in show_slab_objects()
      mm/page_owner: don't access uninitialized memmaps when reading /proc/=
pagetypeinfo

Qiang Yu (1):
      dma-buf/resv: fix exclusive fence get

Qu Wenruo (6):
      btrfs: block-group: Fix a memory leak due to missing btrfs_put_block_=
group()
      btrfs: qgroup: Always free PREALLOC META reserve in btrfs_delalloc_re=
lease_extents()
      btrfs: tracepoints: Fix wrong parameter order for qgroup events
      btrfs: tracepoints: Fix bad entry members of qgroup events
      btrfs: Consider system chunk array size for new SYSTEM chunks
      btrfs: tree-checker: Fix wrong check on max devid

Quinn Tran (1):
      scsi: qla2xxx: Fix partial flash write of MBI

Radhey Shyam Pandey (2):
      dmaengine: xilinx_dma: Fix 64-bit simple AXIDMA transfer
      dmaengine: xilinx_dma: Fix control reg update in vdma_channel_set_con=
fig

Rafael J. Wysocki (12):
      cpufreq: Avoid cpufreq_suspend() deadlock on system shutdown
      PCI: PM: Fix pci_power_up()
      ACPI: processor: Avoid NULL pointer dereferences at init time
      Merge branches 'pm-cpufreq' and 'pm-sleep'
      Merge branch 'acpi-tables'
      PM: QoS: Introduce frequency QoS
      cpufreq: Use per-policy frequency QoS
      PM: QoS: Drop frequency QoS types from device PM QoS
      Merge branch 'opp/fixes' of git://git.kernel.org/.../vireshk/pm
      Merge branches 'pm-cpuidle' and 'pm-opp'
      ACPI: processor: Add QoS requests for all CPUs
      Merge branch 'pm-cpufreq'

Rafi Wiener (1):
      RDMA/mlx5: Clear old rate limit when closing QP

Raju Rangoju (1):
      cxgb4: request the TX CIDX updates to status page

Ralph Campbell (2):
      mm/debug.c: __dump_page() prints an extra line
      mm/debug.c: PageAnon() is true for PageKsm() pages

Ran Wang (1):
      arm64: dts: lx2160a: Correct CPU core idle state name

Randy Dunlap (14):
      serial: uartlite: fix exit path null pointer
      tty: n_hdlc: fix build on SPARC
      Doc: networking/device_drivers/pensando: fix ionic.rst warnings
      phylink: fix kernel-doc warnings
      serial: fix kernel-doc warning in comments
      fs/direct-io.c: fix kernel-doc warning
      fs/libfs.c: fix kernel-doc warning
      fs/fs-writeback.c: fix kernel-doc warning
      bitmap.h: fix kernel-doc warning and typo
      xarray.h: fix kernel-doc warning
      mm/slab.c: fix kernel-doc warning for __ksize()
      scripts: setlocalversion: fix a bashism
      net: ethernet: broadcom: have drivers select DIMLIB as needed
      reset: fix reset_control_ops kerneldoc comment

Rayagonda Kokatanur (1):
      arm64: dts: Fix gpio to pinmux mapping

Reinhard Speyerer (1):
      USB: serial: option: add support for Cinterion CLS8 devices

Remi Pommarel (1):
      iio: adc: meson_saradc: Fix memory allocation order

Richard Cochran (7):
      ptp: Validate requests to enable time stamping of external signals.
      ptp: Introduce strict checking of external time stamp options.
      mv88e6xxx: Reject requests to enable time stamping on both edges.
      dp83640: Reject requests to enable time stamping on both edges.
      igb: Reject requests that fail to enable time stamping on both edges.
      mlx5: Reject requests to enable time stamping on both edges.
      ptp: Extend the test program to check the external time stamp flags.

Rick Tseng (1):
      usb: xhci: wait for CNR controller not ready bit in xhci resume

Rob Clark (1):
      drm/atomic: fix self-refresh helpers crtc state dereference

Rob Herring (4):
      xen: Stop abusing DT of_dma_configure API
      dt-bindings: riscv: Fix CPU schema errors
      drm/shmem: Add docbook comments for drm_gem_shmem_object madvise fiel=
ds
      dt-bindings: vendor-prefixes: Add 'fsi[ab]' to the list of non-vendor=
 prefixes

Roberto Bergantinos Corpas (1):
      CIFS: avoid using MID 0xFFFF

Robin Gong (1):
      dmaengine: imx-sdma: fix size check for sdma script_number

Robin Murphy (3):
      iommu/io-pgtable-arm: Correct Mali attributes
      iommu/io-pgtable-arm: Support all Mali configurations
      drm/panfrost: Don't dereference bogus MMU pointers

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2019-11-12' of https://github.com/intel/gvt-linu=
x into drm-intel-fixes

Roger Quadros (5):
      usb: cdns3: gadget: Fix full-speed mode
      usb: cdns3: fix cdns3_core_init_role()
      usb: cdns3: Error out if USB_DR_MODE_UNKNOWN in cdns3_core_init_role()
      usb: cdns3: gadget: Don't manage pullups
      usb: cdns3: gadget: Fix g_audio use case when connected to Super-Spee=
d host

Roi Dayan (2):
      net/mlx5: Fix flow counter list auto bits struct
      net/mlx5e: Fix eswitch debug print of max fdb flow

Roman Gushchin (4):
      mm: memcg/slab: fix panic in __free_slab() caused by premature memcg =
pointer release
      mm: slab: make page_cgroup_ino() to recognize non-compound slab pages=
 properly
      mm: memcg: switch to css_tryget() in get_mem_cgroup_from_mm()
      mm: hugetlb: switch to css_tryget() in hugetlb_cgroup_charge_cgroup()

Roman Kagan (1):
      x86/hyperv: Make vapic support x2apic mode

Russell King (4):
      drivers/amba: fix reset control error handling
      ARM: mm: fix alignment handler faults under memory pressure
      ARM: mm: alignment: use "u32" for 32-bit instructions
      Merge branch 'misc' into fixes

Sagi Grimberg (1):
      nvme: fix possible deadlock when nvme_update_formats fails

Salil Mehta (2):
      net: hns: Fix the stray netpoll locks causing deadlock in NAPI path
      net: hns3: cleanup of stray struct hns3_link_mode_mapping

Sameer Pujar (1):
      dmaengine: tegra210-adma: fix transfer failure

Sami Tolvanen (1):
      x86/cpu/vmware: Use the full form of INL in VMWARE_PORT

Samuel Holland (1):
      usb: xhci: fix Immediate Data Transfer endianness

Sandeep Sheriker Mallikarjun (1):
      irqchip/atmel-aic5: Add support for sam9x60 irqchip

Sanket Parmar (1):
      usb: cdns3: gadget: reset EP_CLAIMED flag while unloading

Sara Sharon (1):
      cfg80211: fix a bunch of RCU issues in multi-bssid code

Sascha Hauer (1):
      mmc: mxs: fix flags passed to dmaengine_prep_slave_sg

Sean Christopherson (3):
      x86/apic/x2apic: Fix a NULL pointer deref when handling a dying cpu
      KVM: MMU: Do not treat ZONE_DEVICE pages as being reserved
      KVM: x86/mmu: Take slots_lock when using kvm_mmu_zap_all_fast()

Sean Tranchetti (1):
      net: qualcomm: rmnet: Fix potential UAF when unregistering

Sean Wang (1):
      net: Update address for MediaTek ethernet driver in MAINTAINERS

Sebastian Andrzej Siewior (1):
      nvme-tcp: Initialize sk->sk_ll_usec only with NET_RX_BUSY_POLL

Sebastian Reichel (1):
      ASoC: Add DA7213 audio codec as selectable option

Shakeel Butt (1):
      mm: memcontrol: fix NULL-ptr deref in percpu stats flush

Shannon Nelson (1):
      ionic: fix stats memory dereference

Shengjiu Wang (4):
      arm64: dts: imx8mm: fix compatible string for sdma
      arm64: dts: imx8mn: fix compatible string for sdma
      ASoC: fsl_audmix: Add spin lock to protect tdms
      ASoC: soc-pcm: check symmetry before hw_params

Shiraz, Saleem (1):
      RDMA/i40iw: Associate ibdev to netdev before IB device registration

Shirish S (1):
      drm/amdgpu: dont schedule jobs while in reset

Shuah Khan (3):
      tools: bpf: Use !building_out_of_srctree to determine srctree
      selftests: Add kselftest-all and kselftest-install targets
      tools: gpio: Use !building_out_of_srctree to determine srctree

Shuming Fan (1):
      ASoC: rt5682: fix the charge pump capacitor discharges

Shuning Zhang (1):
      ocfs2: protect extent tree in ocfs2_prepare_inode_for_write()

Simon Arlott (1):
      mailmap: Add Simon Arlott (replacement for expired email address)

Sirong Wang (1):
      RDMA/hns: Correct the value of HNS_ROCE_HEM_CHUNK_LEN

Soeren Moch (3):
      arm64: dts: rockchip: fix RockPro64 vdd-log regulator settings
      arm64: dts: rockchip: fix RockPro64 sdhci settings
      arm64: dts: rockchip: fix RockPro64 sdmmc settings

Song Liu (6):
      perf/core: Rework memory accounting in perf_mmap()
      perf/core: Fix corner case in perf_rotate_context()
      md/raid0: fix warning message for parameter default_layout
      kernel/events/uprobes.c: only do FOLL_SPLIT_PMD for uprobe register
      MAINTAINERS: update information for "MEMORY MANAGEMENT"
      mm,thp: recheck each page before collapsing file THP

Srinivas Kandagatla (1):
      ASoC: qcom: q6asm: add support to flac config

Srinivas Pandruvada (1):
      cpufreq: intel_pstate: Fix invalid EPB setting

Srivatsa S. Bhat (VMware) (2):
      tracing/hwlat: Report total time spent in all NMIs during the sample
      tracing/hwlat: Don't ignore outer-loop duration when calculating max_=
latency

Stanislaw Gruszka (1):
      rt2x00: initialize last_reset

Stefan Popa (3):
      iio: accel: adxl372: Fix/remove limitation for FIFO samples
      iio: accel: adxl372: Fix push to buffers lost samples
      iio: accel: adxl372: Perform a reset at start up

Stefan Wahren (3):
      MAINTAINERS: Add BCM2711 to BCM2835 ARCH
      ARM: dts: bcm2835-rpi-zero-w: Fix bus-width of sdhci
      ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue

Stefan-gabriel Mirea (2):
      tty: serial: linflexuart: Fix magic SysRq handling
      tty: serial: Fix PORT_LINFLEXUART definition

Stefano Brivio (2):
      ipv4: Return -ENETUNREACH if we can't create route but saddr is valid
      netfilter: ipset: Copy the right MAC address in hash:ip,mac IPv6 sets

Stefano Garzarella (4):
      vsock/virtio: send a credit update when buffer size is changed
      vsock/virtio: discard packets if credit is not respected
      vsock/virtio: remove unused 'work' field from 'struct virtio_vsock_pk=
t'
      vsock/virtio: fix sock refcnt holding during the shutdown

Steffen Klassert (1):
      xfrm: Fix memleak on xfrm state destroy

Steffen Maier (3):
      scsi: core: fix missing .cleanup_rq for SCSI hosts without request ba=
tching
      scsi: core: fix dh and multipathing for SCSI hosts without request ba=
tching
      scsi: zfcp: fix reaction on bit error threshold notification

Stephan Gerhold (1):
      NFC: nxp-nci: Fix NULL pointer dereference after I2C communication er=
ror

Stephane Grosjean (1):
      can: peak_usb: fix a potential out-of-sync while decoding packets

Stephen Boyd (3):
      Merge tag 'clk-meson-fixes-v5.4-1' of https://github.com/BayLibre/clk=
-meson into clk-fixes
      Merge tag 'sunxi-clk-fixes-for-5.4-1' of https://git.kernel.org/.../s=
unxi/linux into clk-fixes
      Merge tag 'clk-v5.4-samsung-fixes' of https://git.kernel.org/.../snaw=
rocki/clk into clk-fixes

Stephen Rothwell (1):
      powerpc/64s/radix: Fix build failure with RADIX_MMU=3Dn

Steve French (5):
      smb3: cleanup some recent endian errors spotted by updated sparse
      smb3: remove noisy debug message and minor cleanup
      smb3: Fix regression in time handling
      cifs: clarify comment about timestamp granularity for old servers
      fix memory leak in large read decrypt offload

Steve MacLean (3):
      perf map: Fix overlapped map handling
      perf inject jit: Fix JIT_CODE_MOVE filename
      perf docs: Correct and clarify jitdump spec

Steve Wahl (2):
      x86/boot/64: Make level2_kernel_pgt pages invalid outside kernel area
      x86/boot/64: Round memory hole size up to next PMD page

Steven Price (2):
      drm/panfrost: Add missing GPU feature registers
      drm/panfrost: Handle resetting on timeout better

Steven Rostedt (VMware) (10):
      tracefs: Revert ccbd54ff54e8 ("tracefs: Restrict tracefs when the ker=
nel is locked down")
      ftrace: Get a reference counter for the trace_array on filter files
      tracing: Get trace_array reference for available_tracers files
      tracing: Have trace events system open call tracing_open_generic_tr()
      tracing: Add tracing_check_open_get_tr()
      tracing: Add locked_down checks to the open calls of files created fo=
r tracefs
      tracing: Do not create tracefs files if tracefs lockdown is in effect
      recordmcount: Fix nop_mcount() function
      perf scripting engines: Iterate on tep event arrays directly
      perf tools: Remove unused trace_find_next_event()

Sudarsana Reddy Kalluru (1):
      qed: Optimize execution time for nvm attributes configuration.

Sudeep Holla (1):
      cpufreq: Cancel policy update work scheduled before freeing

Suman Anna (2):
      ARM: OMAP2+: Plug in device_enable/idle ops for IOMMUs
      ARM: OMAP2+: Add pdata for OMAP3 ISP IOMMU

Suthikulpanit, Suravee (1):
      iommu/amd: Fix incorrect PASID decoding from event log

Suwan Kim (1):
      usbip: Fix free of unallocated memory in vhci tx

Sven Eckelmann (2):
      batman-adv: Avoid free/alloc race when handling OGM2 buffer
      batman-adv: Avoid free/alloc race when handling OGM buffer

Sven Schnelle (2):
      parisc: Remove 32-bit DMA enforcement from sba_iommu
      parisc: fix frame pointer in ftrace_regs_caller()

Taehee Yoo (12):
      net: core: limit nested device depth
      net: core: add generic lockdep keys
      bonding: fix unexpected IFF_BONDING bit unset
      bonding: use dynamic lockdep key instead of subclass
      team: fix nested locking lockdep warning
      macsec: fix refcnt leak in module exit routine
      net: core: add ignore flag to netdev_adjacent structure
      vxlan: add adjacent link to limit depth level
      net: remove unnecessary variables and callback
      virt_wifi: fix refcnt leak in module exit routine
      bonding: fix using uninitialized mode_lock
      vxlan: fix unexpected failure of vxlan_changelink()

Takashi Iwai (3):
      staging: bcm2835-audio: Fix draining behavior regression
      iommu/amd: Apply the same IVRS IOAPIC workaround to Acer Aspire A315-=
41
      ASoC: core: Fix compile warning with CONFIG_DEBUG_FS=3Dn

Takeshi Misawa (1):
      keys: Fix memory leak in copy_net_ns

Talel Shenhar (1):
      irqchip/al-fic: Add support for irq retrigger

Tariq Toukan (14):
      net/mlx5e: Tx, Fix assumption of single WQEBB of NOP in cleanup flow
      net/mlx5e: Tx, Zero-memset WQE info struct upon update
      net/mlx5e: kTLS, Release reference on DUMPed fragments in shutdown fl=
ow
      net/mlx5e: kTLS, Size of a Dump WQE is fixed
      net/mlx5e: kTLS, Save only the frag page to release at completion
      net/mlx5e: kTLS, Save by-value copy of the record frags
      net/mlx5e: kTLS, Fix page refcnt leak in TX resync error flow
      net/mlx5e: kTLS, Fix missing SQ edge fill
      net/mlx5e: kTLS, Limit DUMP wqe size
      net/mlx5e: kTLS, Remove unneeded cipher type checks
      net/mlx5e: kTLS, Save a copy of the crypto info
      net/mlx5e: kTLS, Enhance TX resync flow
      net/mlx5e: TX, Fix consumer index of error cqe dump
      Documentation: TLS: Add missing counter description

Tejun Heo (6):
      writeback: fix use-after-free in finish_writeback_work()
      blkcg: Fix multiple bugs in blkcg_activate_policy()
      blk-rq-qos: fix first node deletion of rq_qos_del()
      net: fix sk_page_frag() recursion from memory reclaim
      blkcg: make blkcg_print_stat() print stats only for online blkgs
      cgroup,writeback: don't switch wbs immediately on dead wbs if the mem=
cg is dead

Tero Kristo (1):
      ARM: dts: omap5: fix gpu_cm clock provider name

Thiago Jung Bauermann (1):
      powerpc/prom_init: Undo relocation before entering secure mode

Thierry Reding (3):
      arm64: errata: Update stale comment
      gpio: max77620: Use correct unit for debounce times
      Revert "pwm: Let pwm_get_state() return the last implemented state"

Thomas Bogendoerfer (7):
      MIPS: include: Mark __cmpxchg as __always_inline
      MIPS: include: Mark __xchg as __always_inline
      MIPS: fw: sni: Fix out of bounds init of o32 stack
      scsi: sni_53c710: fix compilation error
      scsi: fix kconfig dependency warning related to 53C700_LE_ON_BE
      net: i82596: fix dma_alloc_attr for sni_82596
      MIPS: SGI-IP27: fix exception handler replication

Thomas Gleixner (7):
      Merge tag 'irqchip-fixes-5.4-1' of git://git.kernel.org/.../maz/arm-p=
latforms into irq/urgent
      lib/vdso: Make clock_getres() POSIX compliant again
      Merge tag 'irqchip-fixes-5.4-2' of git://git.kernel.org/.../maz/arm-p=
latforms into irq/urgent
      Merge git://git.kernel.org/.../torvalds/linux
      Merge tag 'timers-v5.4-rc6' of https://git.linaro.org/people/daniel.l=
ezcano/linux into timers/urgent
      x86/dumpstack/64: Don't evaluate exception stacks before setup
      Merge tag 'perf-urgent-for-mingo-5.4-20191105' of git://git.kernel.or=
g/.../acme/linux into perf/urgent

Thomas Hellstrom (3):
      drm/ttm: Restore ttm prefaulting
      x86/cpu/vmware: Use the full form of INL in VMWARE_HYPERCALL, for cla=
ng/llvm
      x86/cpu/vmware: Fix platform detection VMWARE_PORT macro

Thomas Richter (4):
      perf vendor events s390: Add JSON transaction for machine type 8561
      perf vendor events s390: Use s390 machine name instead of type 8561
      perf jvmti: Link against tools/lib/ctype.h to have weak strlcpy()
      perf/aux: Fix tracking of auxiliary trace buffer allocation

Tianci.Yin (4):
      drm/amdgpu/gfx10: update gfx golden settings
      drm/amdgpu/gfx10: update gfx golden settings for navi14
      drm/amdgpu/gfx10: update gfx golden settings for navi12
      drm/amdgpu: add navi14 PCI ID

Timo Schl=C3=BC=C3=9Fler (1):
      can: mcp251x: mcp251x_restart_work_handler(): Fix potential force_qui=
t race condition

Toke H=C3=B8iland-J=C3=B8rgensen (3):
      xdp: Prevent overflow in devmap_hash cost calculation for 32-bit buil=
ds
      xdp: Handle device unregister for devmap_hash map type
      net/fq_impl: Switch to kvmalloc() for memory allocation

Tom Lendacky (1):
      perf/x86/amd: Change/fix NMI latency mitigation to use a timestamp

Tomas Winkler (1):
      mei: me: add comet point (lake) LP device ids

Tomeu Vizoso (1):
      panfrost: Properly undo pm_runtime_enable when deferring a probe

Tomi Valkeinen (1):
      drm/bridge: tc358767: fix max_tu_symbol value

Tony Lindgren (8):
      ARM: omap2plus_defconfig: Fix selected panels after generic panel cha=
nges
      Merge tag 'fix-missing-panels' into fixes
      ARM: dts: Use level interrupt for omap4 & 5 wlcore
      Merge tag 'wlcore-fix' into fixes
      bus: ti-sysc: Fix watchdog quirk handling
      Merge branch 'watchdog-fix' into fixes
      dmaengine: cppi41: Fix cppi41_dma_prep_slave_sg() when idle
      clk: ti: clkctrl: Fix failed to enable error with double udelay timeo=
ut

Tony Lu (1):
      tcp: remove redundant new line from tcp_event_sk_skb

Trond Myklebust (7):
      NFS: Fix O_DIRECT accounting of number of bytes read/written
      NFS: Remove redundant mirror tracking in O_DIRECT
      SUNRPC: The TCP back channel mustn't disappear while requests are out=
standing
      SUNRPC: The RDMA back channel mustn't disappear while requests are ou=
tstanding
      SUNRPC: Destroy the back channel when we destroy the host transport
      NFSv4: Don't allow a cached open with a revoked delegation
      NFS: Fix an RCU lock leak in nfs4_refresh_delegation_stateid()

Tudor Ambarus (1):
      mtd: spi-nor: Fix direction of the write_sr() transfer

Tyler Hicks (1):
      cpu/speculation: Uninline and export CPU mitigations helpers

Tzung-Bi Shih (1):
      ASoC: core: add SND_SOC_BYTES_E

Ulf Magnusson (1):
      drm/tiny: Kconfig: Remove always-y THERMAL dep. from TINYDRM_REPAPER

Ulrich Hecht (1):
      ravb: implement MTU change while device is up

Uma Shankar (1):
      drm/i915: Lower RM timeout to avoid DSI hard hangs

Ursula Braun (7):
      net/smc: fix SMCD link group creation with VLAN id
      net/smc: fix closing of fallback SMC sockets
      net/smc: keep vlan_id for SMC-R in smc_listen_work()
      net/smc: fix refcounting for non-blocking connect()
      net/smc: fix ethernet interface refcounting
      net/smc: fix refcount non-blocking connect() -part 2
      net/smc: fix fastopen for non-blocking connect()

Uwe Kleine-K=C3=B6nig (1):
      pwm: bcm-iproc: Prevent unloading the driver module while in use

Valdis Kletnieks (1):
      staging: exfat - fix SPDX tags..

Valentin Schneider (3):
      RISC-V: entry: Remove unneeded need_resched() loop
      sched/topology: Don't try to build empty sched domains
      sched/topology: Allow sched_asym_cpucapacity to be disabled

Valentin Vidic (1):
      net: usb: sr9800: fix uninitialized local variable

Vasily Averin (1):
      fuse: redundant get_fuse_inode() calls in fuse_writepages_fill()

Vasily Khoruzhick (1):
      arm64: dts: allwinner: a64: Drop PMU node

Vasundhara Volam (4):
      bnxt_en: Fix the size of devlink MSIX parameters.
      bnxt_en: Adjust the time to wait before polling firmware readiness.
      bnxt_en: Minor formatting changes in FW devlink_health_reporter
      bnxt_en: Avoid disabling pci device in bnxt_remove_one() for already =
disabled device.

Ville Syrj=C3=A4l=C3=A4 (4):
      drm/i915: Bump skl+ max plane width to 5k for linear/x-tiled
      drm/i915: Favor last VBT child device with conflicting AUX ch/DDC pin
      drm/i915: Fix PCH reference clock for FDI on HSW/BDW
      mm/khugepaged: fix might_sleep() warn with CONFIG_HIGHPTE=3Dy

Vinayak Menon (1):
      mm/page_io.c: do not free shared swap slots

Vincent Chen (4):
      riscv: avoid kernel hangs when trapped in BUG()
      riscv: avoid sending a SIGTRAP to a user thread trapped in WARN()
      riscv: Correct the handling of unexpected ebreak in do_trap_break()
      riscv: remove the switch statement in do_trap_break()

Vincent Guittot (1):
      sched/pelt: Fix update of blocked PELT ordering

Vincent Prince (1):
      net: sch_generic: Use pfifo_fast as fallback scheduler for CAN hardwa=
re

Vincenzo Frascino (6):
      arm64: vdso32: Fix broken compat vDSO build warnings
      arm64: vdso: Remove stale files from old assembly implementation
      arm64: vdso32: Detect binutils support for dmb ishld
      arm64: vdso32: Remove jump label config option in Makefile
      lib: vdso: Remove CROSS_COMPILE_COMPAT_VDSO
      mips: vdso: Fix __arch_get_hw_counter()

Vineela Tummalapalli (1):
      x86/bugs: Add ITLB_MULTIHIT bug infrastructure

Vinicius Costa Gomes (2):
      net: taprio: Fix returning EINVAL when configuring without flags
      sched: etf: Fix ordering of packets with same txtime

Vinod Koul (2):
      ALSA: compress: add flac decoder params
      ASoC: qcom: q6asm-dai: add support to flac decoder

Viresh Kumar (2):
      opp: of: drop incorrect lockdep_assert_held()
      opp: Reinitialize the list_kref before adding the static OPPs again

Vishal Kulkarni (1):
      cxgb4: fix panic when attaching to ULD fail

Vitaly Kuznetsov (6):
      selftests: kvm: synchronize .gitignore to Makefile
      selftests: kvm: vmx_set_nested_state_test: don't check for VMX suppor=
t twice
      selftests: kvm: consolidate VMX support checks
      selftests: kvm: vmx_dirty_log_test: skip the test when VMX is not sup=
ported
      selftests: kvm: fix sync_regs_test with newer gccs
      selftests: kvm: fix build with glibc >=3D 2.30

Vitaly Wool (2):
      mm/z3fold.c: claim page in the beginning of free
      zswap: add Vitaly to the maintainers list

Vivek Goyal (6):
      virtio-fs: Change module name to virtiofs.ko
      virtiofs: Do not end request in submission context
      virtiofs: No need to check fpq->connected state
      virtiofs: Set FR_SENT flag only after request has been sent
      virtiofs: Count pending forgets as in_flight forgets
      virtiofs: Retry request submission from worker context

Vivek Unune (1):
      arm64: dts: rockchip: Fix usb-c on Hugsun X99 TV Box

Vivien Didelot (1):
      net: dsa: fix switch tree list

Vlad Buslov (2):
      net/mlx5e: Only skip encap flows update when encap init failed
      net/mlx5e: Don't store direct pointer to action's tunnel info

Vladimir Murzin (1):
      ARM: 8914/1: NOMMU: Fix exc_ret for XIP

Vladimir Oltean (4):
      net: mscc: ocelot: fix vlan_filtering when enslaving to bridge before=
 link is up
      net: mscc: ocelot: refuse to overwrite the port's native vlan
      net: mscc: ocelot: fix __ocelot_rmw_ix prototype
      net: dsa: tag_8021q: Fix dsa_8021q_restore_pvid for an absent pvid

Vlastimil Babka (6):
      mm, sl[ou]b: improve memory accounting
      mm, sl[aou]b: guarantee natural alignment for kmalloc(power-of-two)
      mm, page_owner: fix off-by-one error in __set_page_owner_handle()
      mm, page_owner: decouple freeing stack trace from debug_pagealloc
      mm, page_owner: rename flag indicating that page is allocated
      mm, compaction: fix wrong pfn handling in __reset_isolation_pfn()

Wanpeng Li (1):
      KVM: Don't shrink/grow vCPU halt_poll_ns if host side polling is disa=
bled

Wei Wang (2):
      ipv4: fix race condition between route lookup and invalidation
      selftests: net: reuseport_dualstack: fix uninitalized parameter

Wei Yongjun (3):
      xhci-ext-caps.c: Add missing platform_device_put() on error in xhci_c=
reate_intel_xhci_sw_pdev()
      intel_th: msu: Fix possible memory leak in mode_store()
      staging: Fix error return code in vboxsf_fill_super()

Wen Yang (2):
      can: dev: add missing of_node_put() after calling of_get_child_by_nam=
e()
      i2c: core: fix use after free in of_i2c_notify

Wenpeng Liang (1):
      RDMA/hns: Correct the value of srq_desc_size

Wenwen Wang (1):
      e1000: fix memory leaks

Will Deacon (13):
      arm64: Mark functions using explicit register variables as '__always_=
inline'
      mac80211: Reject malformed SSID elements
      cfg80211: wext: avoid copying malformed SSIDs
      arm64: Default to building compat vDSO with clang when CONFIG_CC_IS_C=
LANG
      arm64: vdso32: Move definition of COMPATCC into vdso32/Makefile
      arm64: vdso32: Don't use KBUILD_CPPFLAGS unconditionally
      arm64: vdso32: Pass '--target' option to clang via VDSO_CAFLAGS
      arm64: vdso32: Rename COMPATCC to CC_COMPAT
      arm64: Kconfig: Make CONFIG_COMPAT_VDSO a proper Kconfig option
      panic: ensure preemption is disabled during panic()
      arm64: tags: Preserve tags for addresses translated via TTBR1
      Merge branch 'errata/tx2-219' into for-next/fixes
      fjes: Handle workqueue allocation failure

William Kucharski (1):
      mm/vmscan.c: support removing arbitrary sized pages from mapping

Xiang Chen (1):
      scsi: sd: define variable dif as unsigned int instead of bool

Xiaochen Shen (2):
      x86/resctrl: Prevent NULL pointer dereference when reading mondata
      x86/resctrl: Fix potential lockdep warning

Xiaodong Xu (1):
      xfrm: release device reference for invalid state

Xiaojie Yuan (2):
      drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet for pipe sync
      drm/amdgpu: fix null pointer deref in firmware header printing

Xiaoyao Li (1):
      KVM: X86: Reset the three MSR list number variables to 0 in kvm_init_=
msr_list()

Xin Long (4):
      sctp: add chunks to sk_backlog when the newsk sk_socket is not set
      sctp: change sctp_prot .no_autobind with true
      erspan: fix the tun_info options_len check for erspan
      vxlan: check tun_info options_len properly

Xingyu Chen (1):
      watchdog: meson: Fix the wrong value of left time

Xiubo Li (1):
      nbd: fix possible sysfs duplicate warning

Xuewei Zhang (1):
      sched/fair: Scale bandwidth quota and period without losing quota/per=
iod ratio precision

Yang Shi (2):
      mm: thp: handle page cache THP correctly in PageTransCompoundMap
      mm: mempolicy: fix the wrong return value and potential pages leak of=
 mbind

Yang Yingliang (1):
      arm64: sysreg: fix incorrect definition of SYS_PAR_EL1_F

Yangchun Fu (1):
      gve: Fixes DMA synchronization.

Yash Shah (1):
      RISC-V: Add PCIe I/O BAR memory mapping

Yauhen Kharuzhy (1):
      Input: goodix - add support for 9-bytes reports

Yegor Yefremov (1):
      can: don't use deprecated license identifiers

Yi Li (1):
      ocfs2: fix panic due to ocfs2_wq is null

Yi Wang (5):
      mm: fix -Wmissing-prototypes warnings
      net: sched: taprio: fix -Wmissing-prototypes warnings
      posix-cpu-timers: Fix two trivial comments
      drm/panfrost: fix -Wmissing-prototypes warnings
      irq/irqdomain: Update __irq_domain_alloc_fwnode() function documentat=
ion

Yihui ZENG (1):
      s390/cmm: fix information leak in cmm_timeout_handler()

Yinbo Zhu (1):
      usb: dwc3: remove the call trace of USBx_GFLADJ

Yizhuo (1):
      regulator: pfuze100-regulator: Variable "val" in pfuze100_regulator_p=
robe() could be uninitialized

Yonghong Song (1):
      libbpf: handle symbol versioning properly for libbpf.a

Yonglong Liu (3):
      net: phy: Fix "link partner" information disappear issue
      net: hns3: fix mis-counting IRQ vector numbers issue
      net: hns3: fix ETS bandwidth validation bug

Yoshihiro Shimoda (4):
      usb: renesas_usbhs: gadget: Do not discard queues in usb_ep_set_{halt=
,wedge}()
      usb: renesas_usbhs: gadget: Fix usb_ep_set_{halt,wedge}() behavior
      usb: gadget: udc: renesas_usb3: Fix __le16 warnings
      usb: renesas_usbhs: Fix warnings in usbhsg_recip_handler_std_set_devi=
ce()

Yu-Hsuan Hsu (1):
      ASoC: Intel: kbl_rt5663_rt5514_max98927: Add dmic format constraint

Yuantian Tang (1):
      arm64: dts: ls1028a: fix a compatible issue

YueHaibing (8):
      scripts: add_namespace: Fix coccicheck failed
      dm clone: Make __hash_find static
      act_mirred: Fix mirred_init_module error handling
      w1: ds250x: Fix build error without CRC16
      netdevsim: Fix error handling in nsim_fib_init and nsim_fib_exit
      iommu/ipmmu-vmsa: Remove dev_err() on platform_get_irq() failure
      staging: vboxsf: Remove unused including <linux/version.h>
      mdio_bus: Fix PTR_ERR applied after initialization to constant

Yufen Yu (1):
      scsi: core: try to get module before removing device

Yunfeng Ye (4):
      arm64: armv8_deprecated: Checking return value for memory allocation
      perf tools: Fix resource leak of closedir() on the error paths
      perf c2c: Fix memory leak in build_cl_output()
      perf kmem: Fix memory leak in compact_gfp_flags()

Yunhao Tian (1):
      drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.

Yunsheng Lin (1):
      net: hns3: reallocate SSU' buffer size when pfc_en changes

Zenghui Yu (2):
      irqchip/gic-v3: Fix GIC_LINE_NR accessor
      irqchip/gic-v3-its: Use the exact ITSList for VMOVP

Zhan Liu (2):
      drm/amd/display: Add ENGINE_ID_DIGD condition check for Navi14
      Revert "drm/amd/display: setting the DIG_MODE to the correct value."

Zhan liu (2):
      drm/amd/display: Change Navi14's DWB flag to 1
      drm/amd/display: setting the DIG_MODE to the correct value.

Zhang Lixu (1):
      HID: intel-ish-hid: fix wrong error handling in ishtp_cl_alloc_tx_rin=
g()

ZhangXiaoxu (1):
      nfs: Fix nfsi->nrequests count error on nfs_inode_remove_request

Zhenfang Wang (1):
      dmaengine: sprd: Fix the link-list pointer register configuration iss=
ue

Zhengjun Xing (1):
      tracing: Fix "gfp_t" format for synthetic events

Zhenzhong Duan (2):
      x86/boot/acpi: Move get_cmdline_acpi_rsdp() under #ifdef guard
      cpuidle: haltpoll: Take 'idle=3D' override into account

Zygo Blaxell (1):
      btrfs: fix balance convert to single on 32-bit host CPUs

afzal mohammed (1):
      ARM: 8926/1: v7m: remove register save to stack before svc

amy.shih (3):
      hwmon: (nct7904) Fix the incorrect value of vsen_mask in nct7904_data=
 struct
      hwmon: (nct7904) Add array fan_alarm and vsen_alarm to store the alar=
ms in nct7904_data struct.
      hwmon: (nct7904) Fix the incorrect value of vsen_mask & tcpu_mask & t=
emp_mode in nct7904_data struct.

changzhu (2):
      drm/amdgpu: add dummy read by engines for some GCVM status registers =
in gfx10
      drm/amdgpu: add warning for GRBM 1-cycle delay issue in gfx9

chen gong (1):
      drm/amdgpu: Fix SDMA hang when performing VKexample test

kbuild test robot (2):
      KVM: x86: fix bugon.cocci warnings
      ASoC: rt5677: rt5677_check_hotword() can be static

wenxu (1):
      netfilter: nft_payload: fix missing check for matching length in offl=
oads

yangerkun (2):
      io_uring: consider the overflow of sequence for timeout req
      io_uring: fix logic error in io_timeout

yu kuai (1):
      platform/x86: classmate-laptop: remove unused variable

yuqi jin (1):
      net: stmmac: Fix the problem of tso_xmit

zhanglin (1):
      net: Zeroing the structure ethtool_wolinfo in ethtool_get_wol()

zhangyi (F) (2):
      io_uring : correct timeout req sequence when waiting timeout
      io_uring: correct timeout req sequence when inserting a new entry

zhengbin (1):
      virtiofs: Remove set but not used variable 'fc'

zhong jiang (2):
      iio: Fix an undefied reference error in noa1305_probe
      mm: fix trying to reclaim unevictable lru page when calling madvise_p=
ageout

zhongshiqi (1):
      dc.c:use kzalloc without test

 .mailmap                                           |    8 +-
 CREDITS                                            |    4 +
 Documentation/ABI/testing/sysfs-devices-system-cpu |    2 +
 Documentation/admin-guide/cgroup-v2.rst            |   20 +-
 Documentation/admin-guide/hw-vuln/index.rst        |    2 +
 Documentation/admin-guide/hw-vuln/multihit.rst     |  163 +++
 .../admin-guide/hw-vuln/tsx_async_abort.rst        |  276 +++++
 Documentation/admin-guide/kernel-parameters.txt    |   96 ++
 Documentation/arm64/memory.rst                     |    9 +-
 Documentation/arm64/silicon-errata.rst             |    9 +-
 Documentation/core-api/index.rst                   |    1 +
 Documentation/core-api/memory-allocation.rst       |    4 +
 .../symbol-namespaces.rst}                         |    0
 Documentation/dev-tools/kasan.rst                  |    3 +
 Documentation/dev-tools/kselftest.rst              |   16 +
 .../devicetree/bindings/arm/rockchip.yaml          |    4 +-
 .../bindings/interrupt-controller/atmel,aic.txt    |    7 +-
 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |    9 +-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |   86 +-
 .../bindings/regulator/fixed-regulator.yaml        |    4 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   29 +-
 .../bindings/serial/renesas,sci-serial.txt         |    2 +
 .../devicetree/bindings/sound/adi,adau7118.yaml    |   85 ++
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml  |  267 +++++
 .../sound/allwinner,sun8i-a23-codec-analog.yaml    |   38 +
 .../devicetree/bindings/sound/arndale.txt          |    5 +-
 .../devicetree/bindings/sound/fsl,mqs.txt          |   36 +
 .../bindings/sound/google,cros-ec-codec.txt        |   24 +-
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |    6 +
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |    7 +-
 .../devicetree/bindings/sound/renesas,fsi.txt      |   31 -
 .../devicetree/bindings/sound/renesas,fsi.yaml     |   76 ++
 .../devicetree/bindings/sound/renesas,rsnd.txt     |    1 +
 .../bindings/sound/rockchip-max98090.txt           |   27 +-
 Documentation/devicetree/bindings/sound/rt1011.txt |   10 +
 Documentation/devicetree/bindings/sound/rt5682.txt |    6 +
 .../devicetree/bindings/sound/samsung,odroid.txt   |   54 -
 .../devicetree/bindings/sound/samsung,odroid.yaml  |   91 ++
 .../devicetree/bindings/sound/samsung-i2s.txt      |   84 --
 .../devicetree/bindings/sound/samsung-i2s.yaml     |  138 +++
 .../devicetree/bindings/sound/sun4i-codec.txt      |   94 --
 .../bindings/sound/sun8i-codec-analog.txt          |   17 -
 .../devicetree/bindings/sound/tas2562.txt          |   34 +
 .../devicetree/bindings/sound/tas2770.txt          |   37 +
 .../devicetree/bindings/sound/ti,pcm3168a.txt      |    8 +
 .../devicetree/bindings/sound/tlv320aic31xx.txt    |    5 +
 .../devicetree/bindings/usb/amlogic,dwc3.txt       |    4 +-
 .../devicetree/bindings/usb/generic-ehci.yaml      |    7 +-
 .../devicetree/bindings/usb/generic-ohci.yaml      |    7 +-
 .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |    4 +-
 .../devicetree/bindings/usb/mediatek,mtu3.txt      |    4 +-
 Documentation/devicetree/bindings/usb/usb-hcd.yaml |    5 +
 Documentation/devicetree/bindings/usb/usb-uhci.txt |    2 +-
 Documentation/devicetree/bindings/usb/usb-xhci.txt |    4 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +-
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/inspur-ipsps1.rst              |    2 +-
 Documentation/hwmon/k10temp.rst                    |   18 +-
 .../networking/device_drivers/intel/e100.rst       |   14 +-
 .../networking/device_drivers/intel/e1000.rst      |   12 +-
 .../networking/device_drivers/intel/e1000e.rst     |   14 +-
 .../networking/device_drivers/intel/fm10k.rst      |   10 +-
 .../networking/device_drivers/intel/i40e.rst       |    8 +-
 .../networking/device_drivers/intel/iavf.rst       |    8 +-
 .../networking/device_drivers/intel/ice.rst        |    6 +-
 .../networking/device_drivers/intel/igb.rst        |   12 +-
 .../networking/device_drivers/intel/igbvf.rst      |    6 +-
 .../networking/device_drivers/intel/ixgbe.rst      |   10 +-
 .../networking/device_drivers/intel/ixgbevf.rst    |    6 +-
 .../networking/device_drivers/pensando/ionic.rst   |   10 +-
 Documentation/networking/ip-sysctl.txt             |   11 +-
 Documentation/networking/net_dim.txt               |   36 +-
 Documentation/networking/tls-offload.rst           |    4 +
 Documentation/process/coding-style.rst             |    2 +-
 Documentation/process/deprecated.rst               |   33 +-
 Documentation/usb/rio.rst                          |  109 --
 Documentation/x86/index.rst                        |    1 +
 Documentation/x86/tsx_async_abort.rst              |  117 ++
 MAINTAINERS                                        |   66 +-
 Makefile                                           |   16 +-
 arch/arc/boot/dts/hsdk.dts                         |   23 +
 arch/arc/configs/hsdk_defconfig                    |    6 +
 arch/arc/kernel/perf_event.c                       |    4 +-
 arch/arm/boot/dts/am3874-iceboard.dts              |    9 +-
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |    1 +
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             |    8 +
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi      |    4 +
 arch/arm/boot/dts/imx6-logicpd-som.dtsi            |    4 +
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |    8 +
 arch/arm/boot/dts/imx7s.dtsi                       |    8 +-
 arch/arm/boot/dts/logicpd-torpedo-som.dtsi         |    4 +
 arch/arm/boot/dts/mt7629-rfb.dts                   |   13 +-
 arch/arm/boot/dts/mt7629.dtsi                      |    2 -
 arch/arm/boot/dts/omap4-droid4-xt894.dts           |    2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi          |    2 +-
 arch/arm/boot/dts/omap4-sdp.dts                    |    2 +-
 arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi     |    2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi          |    2 +-
 arch/arm/boot/dts/omap54xx-clocks.dtsi             |    2 +-
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |    8 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |   13 +-
 arch/arm/boot/dts/stm32mp157c.dtsi                 |    4 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                   |    4 +
 arch/arm/boot/dts/sun5i.dtsi                       |    2 +
 arch/arm/boot/dts/sun6i-a31.dtsi                   |    4 +
 arch/arm/boot/dts/sun7i-a20.dtsi                   |    9 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |    2 +
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts          |    1 +
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |    3 +
 arch/arm/boot/dts/sun8i-r40.dtsi                   |    4 +
 arch/arm/boot/dts/sun9i-a80.dtsi                   |    5 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |    6 +
 arch/arm/boot/dts/vf610-zii-scu4-aib.dts           |    2 +
 arch/arm/configs/badge4_defconfig                  |    1 -
 arch/arm/configs/corgi_defconfig                   |    1 -
 arch/arm/configs/davinci_all_defconfig             |    1 +
 arch/arm/configs/imx_v6_v7_defconfig               |    1 +
 arch/arm/configs/omap2plus_defconfig               |   12 +-
 arch/arm/configs/pxa_defconfig                     |    1 -
 arch/arm/configs/s3c2410_defconfig                 |    1 -
 arch/arm/configs/spitz_defconfig                   |    1 -
 arch/arm/crypto/Kconfig                            |    1 +
 arch/arm/crypto/aes-ce-core.S                      |    1 +
 arch/arm/include/asm/domain.h                      |    8 +-
 arch/arm/include/asm/uaccess.h                     |    4 +-
 arch/arm/kernel/head-common.S                      |    5 +-
 arch/arm/kernel/head-nommu.S                       |    2 +
 arch/arm/mach-davinci/dm365.c                      |    4 +-
 arch/arm/mach-omap2/pdata-quirks.c                 |   11 +
 arch/arm/mach-sunxi/mc_smp.c                       |    6 +-
 arch/arm/mm/alignment.c                            |   70 +-
 arch/arm/mm/proc-v7m.S                             |    6 +-
 arch/arm64/Kconfig                                 |   32 +-
 arch/arm64/Makefile                                |   16 -
 .../boot/dts/allwinner/sun50i-a64-pine64-plus.dts  |    9 +
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |    2 +
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |    6 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   11 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |    2 +
 .../dts/broadcom/stingray/stingray-pinctrl.dtsi    |    5 +-
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |    3 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   36 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   12 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   12 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    6 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |    4 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |   13 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |    4 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |   12 +-
 arch/arm64/include/asm/asm-uaccess.h               |    7 +-
 arch/arm64/include/asm/atomic_lse.h                |    6 +-
 arch/arm64/include/asm/cpucaps.h                   |    4 +-
 arch/arm64/include/asm/cputype.h                   |    2 +
 arch/arm64/include/asm/memory.h                    |   10 +-
 arch/arm64/include/asm/pgtable-prot.h              |   15 +-
 arch/arm64/include/asm/pgtable.h                   |   20 -
 arch/arm64/include/asm/sysreg.h                    |    2 +-
 arch/arm64/include/asm/vdso/compat_barrier.h       |    2 +-
 arch/arm64/include/asm/vdso/vsyscall.h             |    7 -
 arch/arm64/include/asm/vdso_datapage.h             |   33 -
 arch/arm64/kernel/armv8_deprecated.c               |    5 +
 arch/arm64/kernel/cpu_errata.c                     |  101 +-
 arch/arm64/kernel/cpufeature.c                     |   16 +-
 arch/arm64/kernel/entry.S                          |    9 +-
 arch/arm64/kernel/ftrace.c                         |   12 +-
 arch/arm64/kernel/hibernate.c                      |    9 +-
 arch/arm64/kernel/process.c                        |   50 +-
 arch/arm64/kernel/vdso32/Makefile                  |   44 +-
 arch/arm64/kvm/hyp/switch.c                        |   69 +-
 arch/arm64/kvm/sys_regs.c                          |    4 +
 arch/arm64/mm/fault.c                              |   19 +-
 arch/mips/bcm63xx/prom.c                           |    2 +-
 arch/mips/configs/mtx1_defconfig                   |    1 -
 arch/mips/configs/rm200_defconfig                  |    1 -
 arch/mips/fw/sni/sniprom.c                         |    2 +-
 arch/mips/include/asm/bmips.h                      |   10 +-
 arch/mips/include/asm/cmpxchg.h                    |    9 +-
 arch/mips/include/asm/vdso/gettimeofday.h          |    4 +-
 arch/mips/include/asm/vdso/vsyscall.h              |    7 -
 arch/mips/include/uapi/asm/hwcap.h                 |   11 +
 arch/mips/kernel/cpu-probe.c                       |   33 +
 arch/mips/kernel/smp-bmips.c                       |    8 +-
 arch/mips/loongson64/Platform                      |    4 +
 arch/mips/mm/tlbex.c                               |   23 +-
 arch/mips/sgi-ip27/Kconfig                         |    7 -
 arch/mips/sgi-ip27/ip27-init.c                     |   21 +-
 arch/mips/sgi-ip27/ip27-memory.c                   |    4 -
 arch/mips/vdso/Makefile                            |    1 +
 arch/parisc/include/asm/cache.h                    |    2 +-
 arch/parisc/include/asm/ldcw.h                     |    2 +-
 arch/parisc/kernel/entry.S                         |    2 +-
 arch/parisc/mm/ioremap.c                           |   12 +-
 arch/powerpc/include/asm/book3s/32/kup.h           |    1 +
 .../powerpc/include/asm/book3s/64/tlbflush-radix.h |    4 +
 arch/powerpc/include/asm/elf.h                     |    3 +
 arch/powerpc/kernel/prom_init.c                    |   13 +
 arch/powerpc/kernel/prom_init_check.sh             |    3 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S            |    1 +
 arch/powerpc/kvm/book3s_xive.c                     |   24 +-
 arch/powerpc/kvm/book3s_xive.h                     |   12 +
 arch/powerpc/kvm/book3s_xive_native.c              |    6 +-
 arch/powerpc/net/bpf_jit_comp64.c                  |   13 +
 arch/powerpc/platforms/cell/spufs/inode.c          |    1 +
 arch/powerpc/platforms/powernv/eeh-powernv.c       |    2 +-
 arch/powerpc/platforms/powernv/smp.c               |   53 +-
 arch/powerpc/platforms/pseries/lpar.c              |    3 +
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |    1 +
 arch/riscv/include/asm/bug.h                       |   16 +-
 arch/riscv/include/asm/io.h                        |    7 +
 arch/riscv/include/asm/irq.h                       |    3 +
 arch/riscv/include/asm/pgtable.h                   |   28 +-
 arch/riscv/include/asm/switch_to.h                 |    1 +
 arch/riscv/include/asm/tlbflush.h                  |    4 -
 arch/riscv/kernel/cpufeature.c                     |    1 +
 arch/riscv/kernel/entry.S                          |    3 +-
 arch/riscv/kernel/head.h                           |   21 +
 arch/riscv/kernel/irq.c                            |    2 +-
 arch/riscv/kernel/module-sections.c                |    1 +
 arch/riscv/kernel/process.c                        |    2 +
 arch/riscv/kernel/ptrace.c                         |    4 +-
 arch/riscv/kernel/reset.c                          |    1 +
 arch/riscv/kernel/setup.c                          |    2 +
 arch/riscv/kernel/signal.c                         |    8 +-
 arch/riscv/kernel/smp.c                            |    2 +
 arch/riscv/kernel/smpboot.c                        |    5 +-
 arch/riscv/kernel/syscall_table.c                  |    1 +
 arch/riscv/kernel/time.c                           |    1 +
 arch/riscv/kernel/traps.c                          |   31 +-
 arch/riscv/kernel/vdso.c                           |    3 +-
 arch/riscv/mm/context.c                            |    1 +
 arch/riscv/mm/fault.c                              |    2 +
 arch/riscv/mm/init.c                               |    7 +-
 arch/riscv/mm/sifive_l2_cache.c                    |    2 +-
 arch/s390/boot/startup.c                           |   14 +-
 arch/s390/include/asm/uaccess.h                    |    4 +-
 arch/s390/include/asm/unwind.h                     |    1 +
 arch/s390/kernel/idle.c                            |   29 +-
 arch/s390/kernel/machine_kexec_reloc.c             |    1 +
 arch/s390/kernel/unwind_bc.c                       |   18 +-
 arch/s390/mm/cmm.c                                 |   12 +-
 arch/sparc/Kconfig                                 |    1 -
 arch/sparc/vdso/Makefile                           |    4 +-
 arch/um/drivers/ubd_kern.c                         |    8 +-
 arch/x86/Kconfig                                   |   45 +
 arch/x86/boot/compressed/acpi.c                    |   48 +-
 arch/x86/boot/compressed/eboot.c                   |    4 +-
 arch/x86/boot/compressed/misc.c                    |   25 +-
 arch/x86/events/amd/core.c                         |   30 +-
 arch/x86/events/amd/ibs.c                          |    8 +-
 arch/x86/events/intel/core.c                       |    4 +
 arch/x86/events/intel/cstate.c                     |   44 +-
 arch/x86/events/intel/pt.c                         |    2 +-
 arch/x86/events/intel/uncore.c                     |   44 +-
 arch/x86/events/intel/uncore.h                     |   12 -
 arch/x86/events/msr.c                              |    7 +
 arch/x86/hyperv/hv_apic.c                          |   20 +-
 arch/x86/include/asm/cpu_entry_area.h              |    2 +-
 arch/x86/include/asm/cpufeatures.h                 |    2 +
 arch/x86/include/asm/intel-family.h                |    3 +
 arch/x86/include/asm/kvm_host.h                    |    8 +-
 arch/x86/include/asm/msr-index.h                   |   16 +
 arch/x86/include/asm/mwait.h                       |    2 +-
 arch/x86/include/asm/nospec-branch.h               |    4 +-
 arch/x86/include/asm/processor.h                   |    7 +
 arch/x86/include/asm/pti.h                         |    2 +-
 arch/x86/include/asm/uaccess.h                     |   23 +
 arch/x86/include/asm/vmware.h                      |   14 +-
 arch/x86/kernel/apic/apic.c                        |   28 +-
 arch/x86/kernel/apic/x2apic_cluster.c              |    3 +-
 arch/x86/kernel/cpu/Makefile                       |    2 +-
 arch/x86/kernel/cpu/bugs.c                         |  159 ++-
 arch/x86/kernel/cpu/common.c                       |   99 +-
 arch/x86/kernel/cpu/cpu.h                          |   18 +
 arch/x86/kernel/cpu/intel.c                        |    5 +
 arch/x86/kernel/cpu/mshyperv.c                     |    4 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c          |    4 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c             |    4 -
 arch/x86/kernel/cpu/tsx.c                          |  140 +++
 arch/x86/kernel/cpu/vmware.c                       |    2 +-
 arch/x86/kernel/dumpstack_64.c                     |    7 +
 arch/x86/kernel/early-quirks.c                     |    2 +
 arch/x86/kernel/head64.c                           |   22 +-
 arch/x86/kernel/process.h                          |    2 +-
 arch/x86/kernel/tsc.c                              |    3 +
 arch/x86/kvm/cpuid.c                               |    2 +-
 arch/x86/kvm/lapic.c                               |    5 -
 arch/x86/kvm/lapic.h                               |    5 +
 arch/x86/kvm/mmu.c                                 |  282 ++++-
 arch/x86/kvm/mmu.h                                 |    4 +
 arch/x86/kvm/paging_tmpl.h                         |   29 +-
 arch/x86/kvm/svm.c                                 |   16 +-
 arch/x86/kvm/vmx/nested.c                          |   64 +-
 arch/x86/kvm/vmx/nested.h                          |   13 +-
 arch/x86/kvm/vmx/vmx.c                             |   49 +-
 arch/x86/kvm/vmx/vmx.h                             |   11 +
 arch/x86/kvm/x86.c                                 |  118 +-
 arch/x86/lib/delay.c                               |    4 +-
 arch/x86/platform/efi/efi.c                        |    3 -
 arch/x86/xen/enlighten.c                           |   28 +-
 arch/x86/xen/enlighten_pv.c                        |    8 +
 arch/xtensa/boot/dts/virt.dts                      |    2 +-
 arch/xtensa/include/asm/bitops.h                   |    2 +-
 arch/xtensa/include/asm/uaccess.h                  |   94 +-
 arch/xtensa/kernel/xtensa_ksyms.c                  |    7 -
 block/bfq-iosched.c                                |   32 +-
 block/bio.c                                        |    2 +-
 block/blk-cgroup.c                                 |   82 +-
 block/blk-iocost.c                                 |   12 +-
 block/blk-rq-qos.c                                 |   14 +-
 block/blk-rq-qos.h                                 |   17 +-
 block/blk-wbt.c                                    |    6 +-
 block/elevator.c                                   |    3 +-
 drivers/acpi/cppc_acpi.c                           |    2 +-
 drivers/acpi/hmat/hmat.c                           |    2 +-
 drivers/acpi/nfit/core.c                           |    2 +-
 drivers/acpi/processor_driver.c                    |    9 +-
 drivers/acpi/processor_perflib.c                   |   40 +-
 drivers/acpi/processor_thermal.c                   |   42 +-
 drivers/acpi/sleep.c                               |   13 -
 drivers/amba/bus.c                                 |   14 +-
 drivers/android/binder.c                           |   11 +-
 drivers/android/binder_alloc.c                     |    8 +-
 drivers/android/binder_internal.h                  |    2 +-
 drivers/ata/ahci.c                                 |    4 +-
 drivers/ata/libahci_platform.c                     |   38 +-
 drivers/ata/libata-scsi.c                          |   21 -
 drivers/base/core.c                                |    3 +
 drivers/base/cpu.c                                 |   17 +
 drivers/base/memory.c                              |   39 +
 drivers/base/platform.c                            |   46 +-
 drivers/base/power/qos.c                           |   70 +-
 drivers/block/drbd/drbd_main.c                     |    1 -
 drivers/block/nbd.c                                |   43 +-
 drivers/block/null_blk_zoned.c                     |    3 +-
 drivers/block/rbd.c                                |   11 +-
 drivers/block/rsxx/core.c                          |    2 +
 drivers/block/zram/zram_drv.c                      |    5 +-
 drivers/bus/ti-sysc.c                              |   18 +-
 drivers/char/hw_random/core.c                      |    5 +-
 drivers/char/random.c                              |    4 +-
 drivers/clk/at91/clk-main.c                        |    5 +-
 drivers/clk/at91/sam9x60.c                         |    1 +
 drivers/clk/at91/sckc.c                            |   20 +-
 drivers/clk/clk-ast2600.c                          |    7 +-
 drivers/clk/imx/clk-imx8mm.c                       |    2 +-
 drivers/clk/imx/clk-imx8mn.c                       |    2 +-
 drivers/clk/meson/g12a.c                           |   13 +-
 drivers/clk/meson/gxbb.c                           |    1 +
 drivers/clk/samsung/clk-exynos5420.c               |   27 +-
 drivers/clk/samsung/clk-exynos5433.c               |   14 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c               |    2 +-
 drivers/clk/sunxi/clk-sunxi.c                      |    4 +-
 drivers/clk/ti/clk-dra7-atl.c                      |    6 -
 drivers/clk/ti/clkctrl.c                           |    5 +-
 drivers/clocksource/sh_mtu2.c                      |   16 +-
 drivers/clocksource/timer-mediatek.c               |   10 +-
 drivers/cpufreq/cpufreq.c                          |   72 +-
 drivers/cpufreq/intel_pstate.c                     |   34 +-
 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c              |   15 +-
 drivers/cpuidle/cpuidle-haltpoll.c                 |    4 +
 drivers/crypto/chelsio/chtls/chtls_cm.c            |    2 +-
 drivers/crypto/chelsio/chtls/chtls_io.c            |    2 +-
 drivers/dma-buf/dma-resv.c                         |    2 +-
 drivers/dma/imx-sdma.c                             |    8 +
 drivers/dma/qcom/bam_dma.c                         |   19 +
 drivers/dma/sprd-dma.c                             |   27 +-
 drivers/dma/tegra210-adma.c                        |    7 +
 drivers/dma/ti/cppi41.c                            |   21 +-
 drivers/dma/xilinx/xilinx_dma.c                    |   10 +-
 drivers/edac/ghes_edac.c                           |    4 +
 drivers/firmware/dmi_scan.c                        |    2 +-
 drivers/firmware/efi/Kconfig                       |    1 +
 drivers/firmware/efi/cper.c                        |    2 +-
 drivers/firmware/efi/efi.c                         |    5 +-
 drivers/firmware/efi/libstub/Makefile              |    1 +
 drivers/firmware/efi/libstub/arm32-stub.c          |   16 +-
 drivers/firmware/efi/libstub/efi-stub-helper.c     |   24 +-
 drivers/firmware/efi/rci2-table.c                  |    2 +-
 drivers/firmware/efi/test/efi_test.c               |    8 +
 drivers/firmware/efi/tpm.c                         |   27 +-
 drivers/firmware/google/vpd_decode.c               |    2 +-
 drivers/gpio/gpio-eic-sprd.c                       |    7 +-
 drivers/gpio/gpio-intel-mid.c                      |    9 +-
 drivers/gpio/gpio-lynxpoint.c                      |   10 +-
 drivers/gpio/gpio-max77620.c                       |    6 +-
 drivers/gpio/gpio-merrifield.c                     |   28 +-
 drivers/gpio/gpiolib-of.c                          |    2 +-
 drivers/gpio/gpiolib.c                             |   49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   36 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   36 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   35 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   54 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   13 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    9 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    9 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    9 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    5 -
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   31 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   33 +-
 drivers/gpu/drm/amd/display/dc/calcs/Makefile      |   19 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    4 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    6 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |   22 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   19 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    7 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   19 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   19 +-
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |    3 +-
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   19 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c |    4 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         |    2 +-
 .../drm/amd/powerplay/smumgr/polaris10_smumgr.c    |    2 +-
 .../gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c    |    2 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    3 +-
 .../drm/arm/display/komeda/komeda_pipeline_state.c |    4 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   11 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   41 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    7 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   15 +-
 drivers/gpu/drm/drm_edid.c                         |    3 +
 drivers/gpu/drm/drm_self_refresh_helper.c          |   18 +-
 drivers/gpu/drm/etnaviv/etnaviv_dump.c             |    4 +-
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c         |    6 +-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |   17 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   22 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    7 +
 drivers/gpu/drm/i915/display/intel_display.c       |   26 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    3 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   12 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   15 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    6 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    5 +
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    7 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  111 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   19 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    6 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    3 -
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    1 +
 drivers/gpu/drm/i915/gt/intel_engine.h             |   14 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   16 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   13 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |    8 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  164 ++-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   12 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |    2 +-
 drivers/gpu/drm/i915/gt/intel_ringbuffer.c         |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    3 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |    4 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |  435 +++++--
 drivers/gpu/drm/i915/i915_drv.c                    |   12 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   33 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   19 +-
 drivers/gpu/drm/i915/i915_gem.h                    |    6 +
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   10 +
 drivers/gpu/drm/i915/i915_request.c                |   69 +-
 drivers/gpu/drm/i915/i915_request.h                |    2 +-
 drivers/gpu/drm/i915/intel_pch.c                   |    1 +
 drivers/gpu/drm/i915/intel_pch.h                   |    1 +
 drivers/gpu/drm/i915/intel_pm.c                    |  122 +-
 drivers/gpu/drm/i915/intel_pm.h                    |    3 +
 drivers/gpu/drm/i915/selftests/i915_gem.c          |    6 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    6 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c          |    9 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |    9 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |    9 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |    3 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |    9 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    3 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   16 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   15 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    1 +
 drivers/gpu/drm/radeon/radeon_drv.c                |   12 +-
 drivers/gpu/drm/radeon/si_dpm.c                    |    1 +
 drivers/gpu/drm/scheduler/sched_main.c             |   19 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    2 +-
 drivers/gpu/drm/tiny/Kconfig                       |    1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |    9 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   16 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |    5 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |   12 +-
 drivers/hid/hid-axff.c                             |   11 +-
 drivers/hid/hid-core.c                             |    7 +-
 drivers/hid/hid-dr.c                               |   12 +-
 drivers/hid/hid-emsff.c                            |   12 +-
 drivers/hid/hid-gaff.c                             |   12 +-
 drivers/hid/hid-google-hammer.c                    |    4 +
 drivers/hid/hid-holtekff.c                         |   12 +-
 drivers/hid/hid-hyperv.c                           |   56 +-
 drivers/hid/hid-ids.h                              |    2 +
 drivers/hid/hid-lg2ff.c                            |   12 +-
 drivers/hid/hid-lg3ff.c                            |   11 +-
 drivers/hid/hid-lg4ff.c                            |   11 +-
 drivers/hid/hid-lgff.c                             |   11 +-
 drivers/hid/hid-logitech-hidpp.c                   |  248 ++--
 drivers/hid/hid-microsoft.c                        |   12 +-
 drivers/hid/hid-prodikeys.c                        |    4 +-
 drivers/hid/hid-sony.c                             |   12 +-
 drivers/hid/hid-tmff.c                             |   12 +-
 drivers/hid/hid-zpff.c                             |   12 +-
 drivers/hid/i2c-hid/i2c-hid-core.c                 |  122 +-
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c           |   19 +
 drivers/hid/intel-ish-hid/ishtp/client-buffers.c   |    2 +-
 drivers/hid/wacom.h                                |   15 +
 drivers/hid/wacom_wac.c                            |   10 +-
 drivers/hv/vmbus_drv.c                             |    6 +
 drivers/hwmon/ina3221.c                            |    2 +-
 drivers/hwmon/nct7904.c                            |   40 +-
 drivers/hwtracing/intel_th/gth.c                   |    3 +
 drivers/hwtracing/intel_th/msu.c                   |   11 +-
 drivers/hwtracing/intel_th/pci.c                   |   10 +
 drivers/i2c/busses/i2c-aspeed.c                    |   54 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |    2 +-
 drivers/i2c/busses/i2c-stm32f7.c                   |   21 +-
 drivers/i2c/i2c-core-acpi.c                        |   28 +-
 drivers/i2c/i2c-core-of.c                          |    4 +-
 drivers/iio/accel/adxl372.c                        |   22 +-
 drivers/iio/accel/bmc150-accel-core.c              |    2 +-
 drivers/iio/adc/ad799x.c                           |    4 +-
 drivers/iio/adc/axp288_adc.c                       |   32 +
 drivers/iio/adc/hx711.c                            |   10 +-
 drivers/iio/adc/meson_saradc.c                     |   10 +-
 drivers/iio/adc/stm32-adc-core.c                   |   70 +-
 drivers/iio/adc/stm32-adc-core.h                   |  137 +++
 drivers/iio/adc/stm32-adc.c                        |  113 +-
 drivers/iio/imu/adis16480.c                        |    5 +-
 drivers/iio/imu/adis_buffer.c                      |   10 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |    9 +
 drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |    2 +
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c         |   15 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h            |    2 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       |   28 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c       |   15 +-
 drivers/iio/light/Kconfig                          |    1 +
 drivers/iio/light/opt3001.c                        |    6 +-
 drivers/iio/light/vcnl4000.c                       |   14 +-
 drivers/iio/proximity/srf04.c                      |   29 +-
 drivers/infiniband/core/cm.c                       |    3 +
 drivers/infiniband/core/cma.c                      |    3 +-
 drivers/infiniband/core/core_priv.h                |    1 +
 drivers/infiniband/core/device.c                   |   11 +-
 drivers/infiniband/core/iwcm.c                     |   52 +-
 drivers/infiniband/core/netlink.c                  |  107 +-
 drivers/infiniband/core/nldev.c                    |   14 +-
 drivers/infiniband/core/security.c                 |    2 +-
 drivers/infiniband/core/umem_odp.c                 |    6 +-
 drivers/infiniband/core/uverbs.h                   |    2 +-
 drivers/infiniband/core/verbs.c                    |    9 +-
 drivers/infiniband/hw/cxgb4/cm.c                   |   30 +-
 drivers/infiniband/hw/cxgb4/device.c               |    7 +-
 drivers/infiniband/hw/cxgb4/mem.c                  |   28 +-
 drivers/infiniband/hw/cxgb4/qp.c                   |   10 +-
 drivers/infiniband/hw/hfi1/init.c                  |    1 -
 drivers/infiniband/hw/hfi1/pcie.c                  |    4 +-
 drivers/infiniband/hw/hfi1/rc.c                    |   16 +-
 drivers/infiniband/hw/hfi1/sdma.c                  |   10 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |   62 +-
 drivers/infiniband/hw/hfi1/tid_rdma.h              |    3 +-
 drivers/infiniband/hw/hfi1/verbs.c                 |   10 +-
 drivers/infiniband/hw/hns/hns_roce_hem.h           |    2 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c         |    6 +-
 drivers/infiniband/hw/hns/hns_roce_srq.c           |    2 +-
 drivers/infiniband/hw/i40iw/i40iw_verbs.c          |    4 +
 drivers/infiniband/hw/mlx5/devx.c                  |   58 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h               |    3 +-
 drivers/infiniband/hw/mlx5/mr.c                    |   68 +-
 drivers/infiniband/hw/mlx5/odp.c                   |   58 +-
 drivers/infiniband/hw/mlx5/qp.c                    |    8 +-
 drivers/infiniband/hw/qedr/main.c                  |    2 +-
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_srq.c      |    2 -
 drivers/infiniband/sw/siw/siw_qp.c                 |   17 +-
 drivers/infiniband/sw/siw/siw_verbs.c              |    2 -
 drivers/input/ff-memless.c                         |    9 +
 drivers/input/misc/da9063_onkey.c                  |    5 +-
 drivers/input/misc/soc_button_array.c              |   17 +-
 drivers/input/mouse/elantech.c                     |   55 +-
 drivers/input/mouse/synaptics.c                    |    1 +
 drivers/input/rmi4/rmi_driver.c                    |    6 +-
 drivers/input/rmi4/rmi_f11.c                       |    9 +-
 drivers/input/rmi4/rmi_f12.c                       |   32 +-
 drivers/input/rmi4/rmi_f54.c                       |    5 +-
 drivers/input/touchscreen/cyttsp4_core.c           |    7 -
 drivers/input/touchscreen/goodix.c                 |   58 +-
 drivers/input/touchscreen/st1232.c                 |    6 +-
 drivers/interconnect/core.c                        |    4 +
 drivers/interconnect/qcom/qcs404.c                 |    3 +-
 drivers/interconnect/qcom/sdm845.c                 |    3 +-
 drivers/iommu/amd_iommu.c                          |   12 +-
 drivers/iommu/amd_iommu_quirks.c                   |   13 +
 drivers/iommu/amd_iommu_types.h                    |    4 +-
 drivers/iommu/arm-smmu.c                           |    1 +
 drivers/iommu/intel-iommu.c                        |   12 +-
 drivers/iommu/io-pgtable-arm.c                     |   58 +-
 drivers/iommu/ipmmu-vmsa.c                         |    7 +-
 drivers/iommu/rockchip-iommu.c                     |   19 +-
 drivers/irqchip/irq-al-fic.c                       |   12 +
 drivers/irqchip/irq-atmel-aic5.c                   |   10 +
 drivers/irqchip/irq-gic-v3-its.c                   |   21 +-
 drivers/irqchip/irq-gic-v3.c                       |    2 +-
 drivers/irqchip/irq-sifive-plic.c                  |   33 +-
 drivers/isdn/capi/capi.c                           |    2 +-
 drivers/macintosh/windfarm_cpufreq_clamp.c         |   38 +-
 drivers/md/dm-cache-target.c                       |   28 +-
 drivers/md/dm-clone-target.c                       |    4 +-
 drivers/md/dm-snap.c                               |   94 +-
 drivers/md/raid0.c                                 |    2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c           |    3 +-
 drivers/memstick/host/jmb38x_ms.c                  |    2 +-
 drivers/mfd/mt6397-core.c                          |   64 +-
 drivers/misc/fastrpc.c                             |    1 +
 drivers/misc/mei/bus-fixup.c                       |   14 +-
 drivers/misc/mei/hw-me-regs.h                      |    3 +
 drivers/misc/mei/hw-me.c                           |   21 +-
 drivers/misc/mei/hw-me.h                           |    8 +-
 drivers/misc/mei/mei_dev.h                         |    4 +
 drivers/misc/mei/pci-me.c                          |   13 +-
 drivers/mmc/host/cqhci.c                           |    3 +-
 drivers/mmc/host/mxs-mmc.c                         |    7 +-
 drivers/mmc/host/renesas_sdhi_core.c               |   31 +-
 drivers/mmc/host/sdhci-iproc.c                     |    1 +
 drivers/mmc/host/sdhci-of-at91.c                   |    2 +-
 drivers/mmc/host/sdhci-omap.c                      |    2 +-
 drivers/mmc/host/sh_mmcif.c                        |    6 +-
 drivers/mtd/nand/raw/au1550nd.c                    |    5 +-
 drivers/mtd/spi-nor/spi-nor.c                      |    2 +-
 drivers/net/bonding/bond_alb.c                     |    2 +-
 drivers/net/bonding/bond_main.c                    |   74 +-
 drivers/net/can/c_can/c_can.c                      |   71 +-
 drivers/net/can/c_can/c_can.h                      |    1 +
 drivers/net/can/dev.c                              |    1 +
 drivers/net/can/flexcan.c                          |   11 +-
 drivers/net/can/rx-offload.c                       |  102 +-
 drivers/net/can/slcan.c                            |    1 +
 drivers/net/can/spi/mcp251x.c                      |    2 +-
 drivers/net/can/ti_hecc.c                          |  232 ++--
 drivers/net/can/usb/gs_usb.c                       |    1 +
 drivers/net/can/usb/mcba_usb.c                     |    3 +-
 drivers/net/can/usb/peak_usb/pcan_usb.c            |   32 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c       |    2 +-
 drivers/net/can/usb/usb_8dev.c                     |    3 +-
 drivers/net/can/xilinx_can.c                       |    1 -
 drivers/net/dsa/b53/b53_common.c                   |    1 -
 drivers/net/dsa/bcm_sf2.c                          |   40 +-
 drivers/net/dsa/microchip/ksz8795.c                |    4 -
 drivers/net/dsa/microchip/ksz8795_spi.c            |    7 +-
 drivers/net/dsa/microchip/ksz9477_i2c.c            |    6 +-
 drivers/net/dsa/microchip/ksz9477_reg.h            |    4 +-
 drivers/net/dsa/microchip/ksz9477_spi.c            |    6 +-
 drivers/net/dsa/microchip/ksz_common.c             |    2 +-
 drivers/net/dsa/microchip/ksz_common.h             |   20 +-
 drivers/net/dsa/mv88e6xxx/ptp.c                    |   13 +
 drivers/net/dsa/sja1105/Kconfig                    |    4 +-
 drivers/net/dsa/sja1105/sja1105.h                  |    4 +-
 drivers/net/dsa/sja1105/sja1105_dynamic_config.h   |    4 +-
 drivers/net/dsa/sja1105/sja1105_ptp.h              |    4 +-
 drivers/net/dsa/sja1105/sja1105_static_config.h    |    4 +-
 drivers/net/dsa/sja1105/sja1105_tas.h              |    4 +-
 drivers/net/ethernet/aquantia/atlantic/aq_main.c   |    4 +-
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |   34 +-
 drivers/net/ethernet/aquantia/atlantic/aq_ring.c   |    3 +-
 .../ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c  |   23 +-
 .../ethernet/aquantia/atlantic/hw_atl/hw_atl_llh.c |   17 +-
 .../ethernet/aquantia/atlantic/hw_atl/hw_atl_llh.h |    7 +-
 .../aquantia/atlantic/hw_atl/hw_atl_llh_internal.h |   19 +
 .../aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c   |    2 +-
 drivers/net/ethernet/arc/emac_rockchip.c           |    3 +
 drivers/net/ethernet/broadcom/Kconfig              |    4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |   10 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.c  |  112 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.h  |    3 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c     |   18 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.h     |    1 +
 drivers/net/ethernet/broadcom/genet/bcmmii.c       |   44 +-
 drivers/net/ethernet/broadcom/tg3.c                |    4 +
 drivers/net/ethernet/cadence/macb_main.c           |   12 +-
 drivers/net/ethernet/cavium/common/cavium_ptp.h    |    2 +-
 drivers/net/ethernet/cavium/octeon/octeon_mgmt.c   |    2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c     |   28 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c           |    8 +-
 drivers/net/ethernet/cirrus/ep93xx_eth.c           |    5 +-
 drivers/net/ethernet/cortina/gemini.c              |    1 +
 drivers/net/ethernet/cortina/gemini.h              |    2 +-
 drivers/net/ethernet/faraday/ftgmac100.c           |   25 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c   |   60 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.h   |    2 +-
 drivers/net/ethernet/freescale/dpaa2/dpni.h        |    5 +-
 drivers/net/ethernet/freescale/dpaa2/dprtc-cmd.h   |    2 +-
 drivers/net/ethernet/freescale/dpaa2/dprtc.h       |    2 +-
 drivers/net/ethernet/freescale/fec_main.c          |    4 +-
 drivers/net/ethernet/freescale/fec_ptp.c           |    4 +-
 drivers/net/ethernet/google/gve/gve_rx.c           |    2 +
 drivers/net/ethernet/google/gve/gve_tx.c           |   24 +-
 drivers/net/ethernet/hisilicon/hip04_eth.c         |   16 +-
 drivers/net/ethernet/hisilicon/hns/hnae.c          |    1 -
 drivers/net/ethernet/hisilicon/hns/hnae.h          |    3 -
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |   22 +-
 drivers/net/ethernet/hisilicon/hns3/hnae3.h        |    4 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.h    |    2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c |    5 -
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h |    2 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_dcb.c |   19 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_dcb.h |    2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   55 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.h    |    3 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_mdio.h    |    2 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |   11 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.h  |    2 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |   28 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h  |    1 +
 drivers/net/ethernet/i825xx/lasi_82596.c           |    4 +-
 drivers/net/ethernet/i825xx/lib82596.c             |    4 +-
 drivers/net/ethernet/i825xx/sni_82596.c            |    4 +-
 drivers/net/ethernet/ibm/ibmvnic.c                 |    8 +-
 drivers/net/ethernet/intel/e1000/e1000_ethtool.c   |    7 +-
 drivers/net/ethernet/intel/i40e/i40e_adminq_cmd.h  |    2 +
 drivers/net/ethernet/intel/i40e/i40e_common.c      |    3 +-
 drivers/net/ethernet/intel/i40e/i40e_xsk.c         |   15 +-
 drivers/net/ethernet/intel/iavf/iavf_main.c        |    4 +-
 drivers/net/ethernet/intel/ice/ice_sched.c         |    2 +-
 drivers/net/ethernet/intel/igb/e1000_82575.c       |    2 +-
 drivers/net/ethernet/intel/igb/igb_main.c          |   12 +-
 drivers/net/ethernet/intel/igb/igb_ptp.c           |   17 +
 drivers/net/ethernet/intel/igc/igc_main.c          |    7 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |    1 -
 drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.c       |   10 +-
 drivers/net/ethernet/marvell/mvneta_bm.h           |   32 +-
 drivers/net/ethernet/marvell/octeontx2/af/cgx.h    |    4 +-
 .../net/ethernet/marvell/octeontx2/af/cgx_fw_if.h  |    4 +-
 drivers/net/ethernet/marvell/octeontx2/af/common.h |    4 +-
 drivers/net/ethernet/marvell/octeontx2/af/mbox.h   |    4 +-
 drivers/net/ethernet/marvell/octeontx2/af/npc.h    |    4 +-
 .../ethernet/marvell/octeontx2/af/npc_profile.h    |    4 +-
 drivers/net/ethernet/marvell/octeontx2/af/rvu.h    |    4 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_reg.h    |    4 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_struct.h |    4 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c        |    1 +
 drivers/net/ethernet/mellanox/mlx4/main.c          |    6 +-
 .../net/ethernet/mellanox/mlx4/resource_tracker.c  |   42 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h       |    3 +-
 .../ethernet/mellanox/mlx5/core/en/hv_vhca_stats.c |    4 +-
 .../net/ethernet/mellanox/mlx5/core/en/tc_tun.c    |   12 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/txrx.h  |   13 +-
 .../ethernet/mellanox/mlx5/core/en_accel/ktls.c    |    2 +-
 .../ethernet/mellanox/mlx5/core/en_accel/ktls.h    |   29 +-
 .../ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c |  190 +--
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |    2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |   13 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |    5 +-
 .../net/ethernet/mellanox/mlx5/core/en_selftest.c  |   15 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.c |   16 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h |   10 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   36 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |   35 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |    3 +-
 .../mellanox/mlx5/core/eswitch_offloads_termtbl.c  |   23 +-
 .../net/ethernet/mellanox/mlx5/core/fpga/conn.c    |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_cmd.c   |    3 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |    2 +-
 .../net/ethernet/mellanox/mlx5/core/lib/clock.c    |   17 +
 drivers/net/ethernet/mellanox/mlx5/core/mr.c       |    8 +-
 .../mellanox/mlx5/core/steering/dr_action.c        |    1 +
 .../ethernet/mellanox/mlx5/core/steering/dr_rule.c |   12 +-
 drivers/net/ethernet/mellanox/mlxsw/core.c         |    9 +-
 .../net/ethernet/mellanox/mlxsw/spectrum_trap.c    |    1 +
 drivers/net/ethernet/microchip/lan743x_ptp.c       |    4 +
 drivers/net/ethernet/mscc/ocelot.c                 |   20 +-
 drivers/net/ethernet/mscc/ocelot.h                 |    2 +-
 drivers/net/ethernet/netronome/nfp/nfp_net_repr.c  |   18 -
 drivers/net/ethernet/nxp/lpc_eth.c                 |    3 -
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |    2 +
 drivers/net/ethernet/pensando/ionic/ionic_lif.h    |    2 +
 drivers/net/ethernet/pensando/ionic/ionic_main.c   |    2 +
 drivers/net/ethernet/pensando/ionic/ionic_stats.c  |   29 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c         |   27 +-
 drivers/net/ethernet/qlogic/qed/qed_sriov.c        |    2 +-
 drivers/net/ethernet/qlogic/qede/qede_main.c       |   12 +-
 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c |    4 +-
 drivers/net/ethernet/realtek/r8169_main.c          |   42 +-
 drivers/net/ethernet/renesas/ravb.h                |    3 +-
 drivers/net/ethernet/renesas/ravb_main.c           |   26 +-
 drivers/net/ethernet/renesas/ravb_ptp.c            |   11 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |    5 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |    4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c       |    1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |    2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |    2 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |    3 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   |    3 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |    4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |    2 +-
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c     |    6 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   85 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c   |    6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c |  137 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |    2 +-
 drivers/net/ethernet/ti/davinci_cpdma.c            |    2 +-
 drivers/net/fjes/fjes_main.c                       |   15 +-
 drivers/net/hamradio/bpqether.c                    |   22 -
 drivers/net/hyperv/netvsc_drv.c                    |   15 +-
 drivers/net/ipvlan/ipvlan_main.c                   |    2 -
 drivers/net/macsec.c                               |   18 -
 drivers/net/macvlan.c                              |   19 -
 drivers/net/netdevsim/dev.c                        |    7 +
 drivers/net/netdevsim/fib.c                        |    3 +-
 drivers/net/phy/bcm7xxx.c                          |    1 +
 drivers/net/phy/dp83640.c                          |   16 +
 drivers/net/phy/mdio_bus.c                         |   11 +-
 drivers/net/phy/micrel.c                           |   42 +-
 drivers/net/phy/phy-c45.c                          |    2 +
 drivers/net/phy/phy.c                              |    3 -
 drivers/net/phy/phy_device.c                       |   11 +-
 drivers/net/phy/phylink.c                          |   18 +-
 drivers/net/phy/smsc.c                             |    1 +
 drivers/net/ppp/ppp_generic.c                      |    2 -
 drivers/net/slip/slip.c                            |    1 +
 drivers/net/team/team.c                            |   16 +-
 drivers/net/tun.c                                  |    4 +-
 drivers/net/usb/ax88172a.c                         |    2 +-
 drivers/net/usb/cdc_ether.c                        |    7 +
 drivers/net/usb/cdc_ncm.c                          |    6 +-
 drivers/net/usb/hso.c                              |   13 +-
 drivers/net/usb/lan78xx.c                          |   17 +-
 drivers/net/usb/qmi_wwan.c                         |    4 +
 drivers/net/usb/r8152.c                            |    1 +
 drivers/net/usb/sr9800.c                           |    2 +-
 drivers/net/vrf.c                                  |    1 -
 drivers/net/vxlan.c                                |   62 +-
 drivers/net/wimax/i2400m/op-rfkill.c               |    2 +-
 drivers/net/wireless/ath/ath10k/core.c             |   15 +-
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c       |   10 +-
 drivers/net/wireless/intel/iwlwifi/fw/api/scan.h   |   22 +-
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c        |    1 +
 drivers/net/wireless/intel/iwlwifi/fw/file.h       |    3 +
 drivers/net/wireless/intel/iwlwifi/iwl-csr.h       |    1 +
 drivers/net/wireless/intel/iwlwifi/iwl-io.h        |   12 +-
 drivers/net/wireless/intel/iwlwifi/iwl-prph.h      |    5 +
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |   43 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |    9 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h       |    6 +
 drivers/net/wireless/intel/iwlwifi/mvm/scan.c      |   40 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |  140 ++-
 .../wireless/intel/iwlwifi/pcie/ctxt-info-gen3.c   |   36 +-
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c      |  295 +++--
 .../net/wireless/intel/iwlwifi/pcie/trans-gen2.c   |   25 +
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c    |   25 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c  |   20 +-
 drivers/net/wireless/intersil/hostap/hostap_hw.c   |   25 -
 drivers/net/wireless/mac80211_hwsim.c              |    2 +-
 drivers/net/wireless/mediatek/mt76/Makefile        |    2 +
 drivers/net/wireless/mediatek/mt76/dma.c           |    6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |    6 +-
 drivers/net/wireless/mediatek/mt76/mt76x2/pci.c    |    2 +
 drivers/net/wireless/mediatek/mt76/pci.c           |   46 +
 drivers/net/wireless/ralink/rt2x00/rt2x00.h        |    1 -
 drivers/net/wireless/ralink/rt2x00/rt2x00debug.c   |    2 +-
 drivers/net/wireless/realtek/rtlwifi/pci.c         |    3 +-
 drivers/net/wireless/realtek/rtlwifi/ps.c          |    6 +
 drivers/net/wireless/virt_wifi.c                   |   54 +-
 drivers/net/xen-netback/interface.c                |    1 -
 drivers/nfc/fdp/i2c.c                              |    2 +-
 drivers/nfc/nxp-nci/i2c.c                          |    6 +-
 drivers/nfc/pn533/usb.c                            |    9 +-
 drivers/nfc/st21nfca/core.c                        |    1 +
 drivers/nvme/host/core.c                           |   94 +-
 drivers/nvme/host/fabrics.h                        |    3 +-
 drivers/nvme/host/multipath.c                      |   11 +-
 drivers/nvme/host/nvme.h                           |    5 +-
 drivers/nvme/host/pci.c                            |   83 +-
 drivers/nvme/host/rdma.c                           |   16 +
 drivers/nvme/host/tcp.c                            |   13 +-
 drivers/nvme/target/loop.c                         |    4 +-
 drivers/of/of_reserved_mem.c                       |    4 +-
 drivers/of/unittest.c                              |    1 +
 drivers/opp/core.c                                 |   16 +-
 drivers/opp/of.c                                   |    9 +-
 drivers/parisc/sba_iommu.c                         |    8 -
 drivers/pci/pci.c                                  |   24 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  124 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h             |    3 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |   12 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    4 +-
 drivers/pinctrl/berlin/pinctrl-as370.c             |    2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   30 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   48 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   26 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   16 +-
 drivers/platform/chrome/cros_ec_trace.c            |    5 +-
 drivers/platform/x86/classmate-laptop.c            |   12 -
 drivers/platform/x86/i2c-multi-instantiate.c       |    1 +
 drivers/platform/x86/intel_punit_ipc.c             |    3 +-
 drivers/ptp/Kconfig                                |    4 +-
 drivers/ptp/ptp_chardev.c                          |   20 +-
 drivers/pwm/core.c                                 |    9 +-
 drivers/pwm/pwm-bcm-iproc.c                        |    1 +
 drivers/regulator/core.c                           |   13 +
 drivers/regulator/da9062-regulator.c               |  118 +-
 drivers/regulator/fixed.c                          |    5 +-
 drivers/regulator/lochnagar-regulator.c            |    1 +
 drivers/regulator/of_regulator.c                   |   27 +-
 drivers/regulator/pfuze100-regulator.c             |    8 +-
 drivers/regulator/qcom-rpmh-regulator.c            |    4 +-
 drivers/regulator/ti-abb-regulator.c               |   26 +-
 drivers/reset/core.c                               |    5 +-
 drivers/s390/cio/cio.h                             |    1 +
 drivers/s390/cio/css.c                             |    7 +-
 drivers/s390/cio/device.c                          |    2 +-
 drivers/s390/crypto/zcrypt_api.c                   |    3 +-
 drivers/s390/net/qeth_l2_main.c                    |   23 +-
 drivers/s390/scsi/zfcp_fsf.c                       |   16 +-
 drivers/scsi/Kconfig                               |    2 +-
 drivers/scsi/ch.c                                  |    1 -
 drivers/scsi/device_handler/scsi_dh_alua.c         |   21 +-
 drivers/scsi/hpsa.c                                |    4 +
 drivers/scsi/lpfc/lpfc_init.c                      |    2 -
 drivers/scsi/lpfc/lpfc_nportdisc.c                 |    4 +-
 drivers/scsi/lpfc/lpfc_scsi.c                      |    2 -
 drivers/scsi/lpfc/lpfc_sli.c                       |    2 +-
 drivers/scsi/qla2xxx/qla_attr.c                    |    7 +-
 drivers/scsi/qla2xxx/qla_bsg.c                     |    6 +-
 drivers/scsi/qla2xxx/qla_isr.c                     |    2 -
 drivers/scsi/qla2xxx/qla_mbx.c                     |    3 +-
 drivers/scsi/qla2xxx/qla_mid.c                     |    8 +-
 drivers/scsi/qla2xxx/qla_os.c                      |   16 +-
 drivers/scsi/scsi_error.c                          |    3 +
 drivers/scsi/scsi_lib.c                            |    7 +-
 drivers/scsi/scsi_sysfs.c                          |   11 +-
 drivers/scsi/sd.c                                  |    6 +-
 drivers/scsi/sd_zbc.c                              |   29 +-
 drivers/scsi/sni_53c710.c                          |    4 +-
 drivers/scsi/ufs/ufs_bsg.c                         |    4 +
 drivers/soc/imx/gpc.c                              |    8 +-
 drivers/soc/imx/soc-imx-scu.c                      |    2 +-
 drivers/soundwire/Kconfig                          |    1 +
 drivers/soundwire/intel.c                          |    4 +-
 drivers/soundwire/slave.c                          |    3 +-
 drivers/staging/exfat/Kconfig                      |    3 +-
 drivers/staging/exfat/Makefile                     |    2 +-
 drivers/staging/exfat/exfat.h                      |    2 +-
 drivers/staging/exfat/exfat_blkdev.c               |    2 +-
 drivers/staging/exfat/exfat_cache.c                |    2 +-
 drivers/staging/exfat/exfat_core.c                 |    2 +-
 drivers/staging/exfat/exfat_nls.c                  |    2 +-
 drivers/staging/exfat/exfat_super.c                |    7 +-
 drivers/staging/exfat/exfat_upcase.c               |    2 +-
 drivers/staging/fbtft/Kconfig                      |   12 +-
 drivers/staging/fbtft/Makefile                     |    4 -
 drivers/staging/fbtft/fbtft-core.c                 |    7 +-
 drivers/staging/fbtft/fbtft_device.c               | 1261 ----------------=
----
 drivers/staging/fbtft/flexfb.c                     |  851 -------------
 drivers/staging/octeon/ethernet-tx.c               |    9 +-
 drivers/staging/octeon/octeon-stubs.h              |    2 +-
 .../staging/rtl8188eu/hal/hal8188e_rate_adaptive.c |    2 +-
 drivers/staging/rtl8188eu/os_dep/usb_intf.c        |    6 +-
 drivers/staging/speakup/sysfs-driver-speakup       |  369 ++++++
 .../vc04_services/bcm2835-audio/bcm2835-pcm.c      |    4 +-
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c    |    1 +
 drivers/staging/vt6655/device_main.c               |    4 +-
 drivers/staging/wlan-ng/cfg80211.c                 |    6 +-
 drivers/target/iscsi/cxgbit/cxgbit_cm.c            |    3 +-
 drivers/target/target_core_device.c                |   21 -
 drivers/thermal/cpu_cooling.c                      |   14 +-
 drivers/thunderbolt/nhi_ops.c                      |    1 -
 drivers/thunderbolt/switch.c                       |   28 +-
 drivers/tty/n_hdlc.c                               |    5 +
 drivers/tty/serial/8250/8250_men_mcb.c             |    8 +-
 drivers/tty/serial/8250/8250_omap.c                |    5 +-
 drivers/tty/serial/Kconfig                         |    1 +
 drivers/tty/serial/fsl_linflexuart.c               |   21 +-
 drivers/tty/serial/fsl_lpuart.c                    |    2 +-
 drivers/tty/serial/imx.c                           |    4 +-
 drivers/tty/serial/owl-uart.c                      |    2 +-
 drivers/tty/serial/rda-uart.c                      |    2 +-
 drivers/tty/serial/serial_core.c                   |    2 +
 drivers/tty/serial/serial_mctrl_gpio.c             |    3 +
 drivers/tty/serial/sh-sci.c                        |    8 +-
 drivers/tty/serial/uartlite.c                      |    3 +-
 drivers/tty/serial/xilinx_uartps.c                 |    8 +-
 drivers/usb/cdns3/cdns3-pci-wrap.c                 |    3 +-
 drivers/usb/cdns3/core.c                           |   22 +-
 drivers/usb/cdns3/ep0.c                            |   12 +-
 drivers/usb/cdns3/gadget.c                         |   78 +-
 drivers/usb/cdns3/host-export.h                    |    1 -
 drivers/usb/cdns3/host.c                           |    1 +
 drivers/usb/class/usblp.c                          |   12 +-
 drivers/usb/core/config.c                          |    5 +
 drivers/usb/dwc3/Kconfig                           |    1 +
 drivers/usb/dwc3/core.c                            |    3 +-
 drivers/usb/dwc3/drd.c                             |    7 +-
 drivers/usb/dwc3/dwc3-pci.c                        |    2 +-
 drivers/usb/dwc3/gadget.c                          |   13 +-
 drivers/usb/dwc3/host.c                            |    7 +-
 drivers/usb/gadget/composite.c                     |    4 +
 drivers/usb/gadget/configfs.c                      |  110 +-
 drivers/usb/gadget/udc/Kconfig                     |    2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            |    6 +-
 drivers/usb/gadget/udc/core.c                      |   11 +
 drivers/usb/gadget/udc/dummy_hcd.c                 |    3 +-
 drivers/usb/gadget/udc/fsl_udc_core.c              |    2 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c               |   10 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |   11 +-
 drivers/usb/host/xhci-debugfs.c                    |   24 +-
 drivers/usb/host/xhci-ext-caps.c                   |    1 +
 drivers/usb/host/xhci-ring.c                       |    6 +-
 drivers/usb/host/xhci.c                            |  116 +-
 drivers/usb/image/microtek.c                       |    4 +
 drivers/usb/misc/Kconfig                           |   10 -
 drivers/usb/misc/Makefile                          |    1 -
 drivers/usb/misc/adutux.c                          |   24 +-
 drivers/usb/misc/chaoskey.c                        |    5 +-
 drivers/usb/misc/iowarrior.c                       |   48 +-
 drivers/usb/misc/ldusb.c                           |   60 +-
 drivers/usb/misc/legousbtower.c                    |   63 +-
 drivers/usb/misc/rio500.c                          |  554 ---------
 drivers/usb/misc/rio500_usb.h                      |   20 -
 drivers/usb/misc/usblcd.c                          |   60 +-
 drivers/usb/misc/yurex.c                           |   18 +-
 drivers/usb/mtu3/mtu3_core.c                       |    1 +
 drivers/usb/renesas_usbhs/common.c                 |   12 +-
 drivers/usb/renesas_usbhs/common.h                 |    1 +
 drivers/usb/renesas_usbhs/fifo.c                   |    2 +-
 drivers/usb/renesas_usbhs/fifo.h                   |    1 +
 drivers/usb/renesas_usbhs/mod_gadget.c             |   22 +-
 drivers/usb/renesas_usbhs/pipe.c                   |   15 +
 drivers/usb/renesas_usbhs/pipe.h                   |    1 +
 drivers/usb/serial/ftdi_sio.c                      |    3 +
 drivers/usb/serial/ftdi_sio_ids.h                  |    9 +
 drivers/usb/serial/keyspan.c                       |    4 +-
 drivers/usb/serial/option.c                        |   11 +
 drivers/usb/serial/ti_usb_3410_5052.c              |   12 +-
 drivers/usb/serial/usb-serial.c                    |    5 +-
 drivers/usb/serial/whiteheat.c                     |   13 +-
 drivers/usb/serial/whiteheat.h                     |    2 +-
 drivers/usb/storage/scsiglue.c                     |   10 -
 drivers/usb/storage/uas.c                          |   20 -
 drivers/usb/typec/tcpm/tcpm.c                      |   14 +-
 drivers/usb/typec/ucsi/displayport.c               |    2 +
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   42 +-
 drivers/usb/usb-skeleton.c                         |   19 +-
 drivers/usb/usbip/vhci_hcd.c                       |    4 +-
 drivers/usb/usbip/vhci_tx.c                        |    3 +
 drivers/vfio/vfio_iommu_type1.c                    |    2 +-
 drivers/vhost/test.c                               |    2 +
 drivers/vhost/vringh.c                             |    8 +-
 drivers/video/fbdev/c2p_core.h                     |    8 +-
 drivers/virt/vboxguest/vboxguest_utils.c           |    3 +-
 drivers/virtio/virtio_ring.c                       |    7 +-
 drivers/w1/slaves/Kconfig                          |    1 +
 drivers/watchdog/bd70528_wdt.c                     |    1 +
 drivers/watchdog/cpwd.c                            |    8 +-
 drivers/watchdog/imx_sc_wdt.c                      |    8 +-
 drivers/watchdog/meson_gxbb_wdt.c                  |    4 +-
 drivers/watchdog/pm8916_wdt.c                      |   15 +-
 drivers/xen/gntdev.c                               |   13 +-
 drivers/xen/grant-table.c                          |    3 +-
 drivers/xen/pvcalls-back.c                         |    2 +-
 fs/afs/dir.c                                       |    7 +-
 fs/aio.c                                           |   10 +-
 fs/autofs/expire.c                                 |    5 +-
 fs/btrfs/block-group.c                             |    1 +
 fs/btrfs/ctree.h                                   |    5 +-
 fs/btrfs/delalloc-space.c                          |    7 +-
 fs/btrfs/disk-io.c                                 |    6 -
 fs/btrfs/file.c                                    |   56 +-
 fs/btrfs/inode-map.c                               |    4 +-
 fs/btrfs/inode.c                                   |   45 +-
 fs/btrfs/ioctl.c                                   |   12 +-
 fs/btrfs/qgroup.c                                  |    4 +-
 fs/btrfs/ref-verify.c                              |    2 +-
 fs/btrfs/relocation.c                              |    9 +-
 fs/btrfs/send.c                                    |    2 +-
 fs/btrfs/space-info.c                              |   21 +
 fs/btrfs/tree-checker.c                            |    8 -
 fs/btrfs/tree-log.c                                |   36 +-
 fs/btrfs/volumes.c                                 |    7 +-
 fs/ceph/caps.c                                     |   10 +-
 fs/ceph/dir.c                                      |   15 +-
 fs/ceph/file.c                                     |   44 +-
 fs/ceph/inode.c                                    |    1 +
 fs/ceph/mds_client.c                               |   21 +-
 fs/ceph/super.c                                    |   11 +-
 fs/cifs/cifsfs.c                                   |   30 +-
 fs/cifs/cifsglob.h                                 |    7 +-
 fs/cifs/cifsproto.h                                |    1 +
 fs/cifs/connect.c                                  |   22 +-
 fs/cifs/dir.c                                      |    8 +-
 fs/cifs/file.c                                     |   62 +-
 fs/cifs/inode.c                                    |    8 +-
 fs/cifs/netmisc.c                                  |    4 -
 fs/cifs/smb1ops.c                                  |    3 +
 fs/cifs/smb2file.c                                 |    2 +-
 fs/cifs/smb2ops.c                                  |    3 +-
 fs/cifs/smb2pdu.c                                  |   14 +-
 fs/cifs/smb2pdu.h                                  |    1 +
 fs/cifs/smb2proto.h                                |    4 +
 fs/cifs/transport.c                                |   42 +-
 fs/configfs/symlink.c                              |    2 +-
 fs/dax.c                                           |    5 +-
 fs/direct-io.c                                     |    3 +-
 fs/ecryptfs/inode.c                                |   84 +-
 fs/exportfs/expfs.c                                |   31 +-
 fs/fs-writeback.c                                  |   20 +-
 fs/fuse/Makefile                                   |    3 +-
 fs/fuse/dev.c                                      |    4 +-
 fs/fuse/dir.c                                      |   16 +-
 fs/fuse/file.c                                     |   14 +-
 fs/fuse/fuse_i.h                                   |    4 +
 fs/fuse/inode.c                                    |    4 +
 fs/fuse/virtio_fs.c                                |  169 ++-
 fs/gfs2/ops_fstype.c                               |   21 +-
 fs/io_uring.c                                      |  386 +++---
 fs/libfs.c                                         |  140 +--
 fs/namespace.c                                     |   15 +-
 fs/nfs/delegation.c                                |   12 +-
 fs/nfs/delegation.h                                |    1 +
 fs/nfs/direct.c                                    |  106 +-
 fs/nfs/nfs4proc.c                                  |    8 +-
 fs/nfs/write.c                                     |    5 +-
 fs/ocfs2/aops.c                                    |   25 +-
 fs/ocfs2/file.c                                    |  136 ++-
 fs/ocfs2/ioctl.c                                   |    2 +-
 fs/ocfs2/journal.c                                 |    3 +-
 fs/ocfs2/localalloc.c                              |    3 +-
 fs/ocfs2/xattr.c                                   |   56 +-
 fs/proc/meminfo.c                                  |    4 +-
 fs/proc/page.c                                     |   28 +-
 fs/readdir.c                                       |   48 +-
 fs/super.c                                         |    5 +-
 fs/tracefs/inode.c                                 |   46 +-
 fs/xfs/libxfs/xfs_ag.c                             |    5 +-
 fs/xfs/libxfs/xfs_attr_leaf.c                      |   21 +-
 fs/xfs/libxfs/xfs_bmap.c                           |    6 +-
 fs/xfs/libxfs/xfs_bmap.h                           |    3 +-
 fs/xfs/libxfs/xfs_dir2_block.c                     |    2 +-
 fs/xfs/libxfs/xfs_fs.h                             |    8 +-
 fs/xfs/scrub/refcount.c                            |    3 +-
 fs/xfs/xfs_bmap_util.c                             |    4 +-
 fs/xfs/xfs_buf.c                                   |   12 +-
 fs/xfs/xfs_log.c                                   |    2 +-
 fs/xfs/xfs_log_recover.c                           |    2 +-
 include/acpi/processor.h                           |   20 +-
 include/asm-generic/vdso/vsyscall.h                |    7 -
 include/drm/bridge/dw_hdmi.h                       |    4 +
 include/drm/drm_gem_shmem_helper.h                 |   13 +
 include/drm/drm_self_refresh_helper.h              |    3 +-
 include/dt-bindings/sound/samsung-i2s.h            |   12 +-
 include/linux/bitmap.h                             |    3 +-
 include/linux/bpf.h                                |    4 +-
 include/linux/can/core.h                           |    1 +
 include/linux/compiler_attributes.h                |   17 +
 include/linux/cpu.h                                |   30 +-
 include/linux/cpufreq.h                            |    7 +-
 include/linux/dynamic_debug.h                      |    6 +
 include/linux/efi.h                                |   18 +-
 include/linux/export.h                             |   20 +-
 include/linux/filter.h                             |    1 -
 include/linux/gfp.h                                |   23 +
 include/linux/gpio/driver.h                        |    8 +
 include/linux/hwmon.h                              |    2 +-
 include/linux/idr.h                                |    2 +-
 include/linux/if_macvlan.h                         |    1 -
 include/linux/if_team.h                            |    1 +
 include/linux/if_vlan.h                            |   11 -
 include/linux/intel-iommu.h                        |    6 +-
 include/linux/kvm_host.h                           |    7 +
 include/linux/leds.h                               |    5 +-
 include/linux/memcontrol.h                         |   29 +
 include/linux/memory.h                             |    1 +
 include/linux/micrel_phy.h                         |    2 +-
 include/linux/mlx5/mlx5_ifc.h                      |    3 +-
 include/linux/mm.h                                 |    5 -
 include/linux/mm_types.h                           |    5 +
 include/linux/netdevice.h                          |   61 +-
 include/linux/page-flags.h                         |   20 +-
 include/linux/page_ext.h                           |   10 +-
 include/linux/perf_event.h                         |    2 +-
 include/linux/platform_data/cros_ec_commands.h     |  285 ++++-
 include/linux/platform_data/dma-imx-sdma.h         |    3 +
 include/linux/platform_device.h                    |    2 +
 include/linux/pm_qos.h                             |   56 +-
 include/linux/radix-tree.h                         |   18 -
 include/linux/reset-controller.h                   |    4 +-
 include/linux/reset.h                              |    2 +-
 include/linux/sched.h                              |    1 +
 include/linux/security.h                           |    1 +
 include/linux/skbuff.h                             |   41 +-
 include/linux/skmsg.h                              |    9 +-
 include/linux/slab.h                               |    4 +
 include/linux/socket.h                             |    2 +-
 include/linux/string.h                             |   21 +-
 include/linux/sunrpc/bc_xprt.h                     |    5 +
 include/linux/sunrpc/xprtsock.h                    |    1 +
 include/linux/sysfs.h                              |    4 +-
 include/linux/tcp.h                                |    6 +-
 include/linux/tpm_eventlog.h                       |   16 +-
 include/linux/uaccess.h                            |    6 +-
 include/linux/virtio_vsock.h                       |    1 -
 include/linux/xarray.h                             |    4 +-
 include/net/bonding.h                              |    5 +-
 include/net/busy_poll.h                            |    6 +-
 include/net/cfg80211.h                             |    8 +
 include/net/devlink.h                              |    5 +-
 include/net/flow_dissector.h                       |    3 +-
 include/net/fq.h                                   |    2 +-
 include/net/fq_impl.h                              |    8 +-
 include/net/hwbm.h                                 |   10 +-
 include/net/ip.h                                   |    4 +-
 include/net/ip_vs.h                                |    1 +
 include/net/llc_conn.h                             |    2 +-
 include/net/neighbour.h                            |    4 +-
 include/net/net_namespace.h                        |   27 +-
 include/net/netfilter/nf_tables.h                  |    3 +-
 include/net/request_sock.h                         |    4 +-
 include/net/sch_generic.h                          |    4 +
 include/net/sctp/sctp.h                            |    5 +
 include/net/sock.h                                 |   52 +-
 include/net/tcp.h                                  |   10 +-
 include/net/tls.h                                  |    5 +
 include/net/vxlan.h                                |    1 +
 include/rdma/ib_verbs.h                            |    2 +-
 include/scsi/scsi_eh.h                             |    1 +
 include/sound/dmaengine_pcm.h                      |    5 +
 include/sound/hda_codec.h                          |    1 +
 include/sound/pxa2xx-lib.h                         |   26 +-
 include/sound/rt5682.h                             |    1 +
 include/sound/simple_card_utils.h                  |    1 +
 include/sound/soc-acpi-intel-match.h               |    3 +
 include/sound/soc-acpi.h                           |    4 +
 include/sound/soc-component.h                      |   49 +-
 include/sound/soc-dpcm.h                           |   18 +-
 include/sound/soc.h                                |   38 +-
 include/sound/sof.h                                |    3 +
 include/sound/sof/dai-imx.h                        |   34 +
 include/sound/sof/dai.h                            |    2 +
 include/sound/sof/header.h                         |    2 +
 include/sound/sof/pm.h                             |    8 +
 include/sound/sof/stream.h                         |    4 +-
 include/sound/wm8904.h                             |    2 +-
 include/trace/events/btrfs.h                       |    3 +-
 include/trace/events/rxrpc.h                       |   18 +-
 include/trace/events/sock.h                        |    4 +-
 include/trace/events/tcp.h                         |    2 +-
 include/uapi/linux/can.h                           |    2 +-
 include/uapi/linux/can/bcm.h                       |    2 +-
 include/uapi/linux/can/error.h                     |    2 +-
 include/uapi/linux/can/gw.h                        |    2 +-
 include/uapi/linux/can/j1939.h                     |    2 +-
 include/uapi/linux/can/netlink.h                   |    2 +-
 include/uapi/linux/can/raw.h                       |    2 +-
 include/uapi/linux/can/vxcan.h                     |    2 +-
 include/uapi/linux/devlink.h                       |    1 +
 include/uapi/linux/fuse.h                          |   37 +
 include/uapi/linux/nvme_ioctl.h                    |    1 +
 include/uapi/linux/ptp_clock.h                     |    5 +-
 include/uapi/linux/sched.h                         |    4 +
 include/uapi/linux/serial_core.h                   |    2 +-
 include/uapi/sound/compress_params.h               |   10 +
 include/uapi/sound/sof/abi.h                       |    2 +-
 include/uapi/sound/sof/tokens.h                    |   11 +-
 kernel/audit_watch.c                               |    2 +-
 kernel/bpf/cgroup.c                                |    4 +-
 kernel/bpf/core.c                                  |    2 +-
 kernel/bpf/devmap.c                                |   33 +-
 kernel/bpf/syscall.c                               |   38 +-
 kernel/cgroup/cgroup.c                             |    5 +-
 kernel/cgroup/cpuset.c                             |    3 +-
 kernel/cpu.c                                       |   27 +-
 kernel/events/core.c                               |   74 +-
 kernel/events/uprobes.c                            |   13 +-
 kernel/fork.c                                      |   37 +-
 kernel/freezer.c                                   |    6 -
 kernel/gen_kheaders.sh                             |   11 +-
 kernel/irq/irqdomain.c                             |    2 +-
 kernel/kthread.c                                   |    6 +-
 kernel/panic.c                                     |    1 +
 kernel/power/main.c                                |    1 +
 kernel/power/qos.c                                 |  240 ++++
 kernel/sched/core.c                                |   28 +-
 kernel/sched/cputime.c                             |    6 +-
 kernel/sched/deadline.c                            |   40 +-
 kernel/sched/fair.c                                |   80 +-
 kernel/sched/idle.c                                |    9 +-
 kernel/sched/rt.c                                  |   37 +-
 kernel/sched/sched.h                               |   30 +-
 kernel/sched/stop_task.c                           |   18 +-
 kernel/sched/topology.c                            |   11 +-
 kernel/signal.c                                    |    2 +-
 kernel/stacktrace.c                                |    6 +-
 kernel/stop_machine.c                              |   10 +-
 kernel/sysctl.c                                    |    4 +-
 kernel/time/hrtimer.c                              |    8 +-
 kernel/time/ntp.c                                  |    2 +-
 kernel/time/posix-cpu-timers.c                     |    6 +-
 kernel/time/sched_clock.c                          |    2 +
 kernel/time/vsyscall.c                             |    9 +-
 kernel/trace/ftrace.c                              |   55 +-
 kernel/trace/trace.c                               |  139 ++-
 kernel/trace/trace.h                               |    2 +
 kernel/trace/trace_dynevent.c                      |    4 +
 kernel/trace/trace_event_perf.c                    |    4 +
 kernel/trace/trace_events.c                        |   35 +-
 kernel/trace/trace_events_hist.c                   |   15 +-
 kernel/trace/trace_events_trigger.c                |    8 +-
 kernel/trace/trace_hwlat.c                         |    4 +-
 kernel/trace/trace_kprobe.c                        |   12 +-
 kernel/trace/trace_printk.c                        |    7 +
 kernel/trace/trace_stack.c                         |    8 +
 kernel/trace/trace_stat.c                          |    6 +-
 kernel/trace/trace_uprobe.c                        |   11 +
 lib/Kconfig                                        |    1 -
 lib/dump_stack.c                                   |    7 +-
 lib/generic-radix-tree.c                           |   32 +-
 lib/idr.c                                          |   31 +-
 lib/radix-tree.c                                   |    2 +-
 lib/string.c                                       |   21 -
 lib/test_meminit.c                                 |   27 +
 lib/test_user_copy.c                               |   37 +-
 lib/test_xarray.c                                  |   24 +
 lib/vdso/Kconfig                                   |    9 -
 lib/vdso/gettimeofday.c                            |    9 +-
 lib/xarray.c                                       |    4 +
 lib/xz/xz_dec_lzma2.c                              |    1 +
 mm/backing-dev.c                                   |    4 +-
 mm/compaction.c                                    |    7 +-
 mm/debug.c                                         |   31 +-
 mm/filemap.c                                       |    1 +
 mm/gup.c                                           |   14 +-
 mm/huge_memory.c                                   |    9 +-
 mm/hugetlb.c                                       |    5 +-
 mm/hugetlb_cgroup.c                                |    2 +-
 mm/init-mm.c                                       |    1 +
 mm/khugepaged.c                                    |   35 +-
 mm/kmemleak.c                                      |   30 +-
 mm/madvise.c                                       |   16 +-
 mm/memblock.c                                      |    6 +-
 mm/memcontrol.c                                    |   48 +-
 mm/memory-failure.c                                |   36 +-
 mm/memory_hotplug.c                                |  117 +-
 mm/mempolicy.c                                     |   14 +-
 mm/memremap.c                                      |   13 +-
 mm/mmu_notifier.c                                  |    2 +-
 mm/page_alloc.c                                    |   31 +-
 mm/page_ext.c                                      |   23 +-
 mm/page_io.c                                       |    6 +-
 mm/page_owner.c                                    |   60 +-
 mm/rmap.c                                          |    1 +
 mm/shmem.c                                         |    6 +
 mm/shuffle.c                                       |    2 +-
 mm/slab.c                                          |    3 +
 mm/slab.h                                          |    4 +-
 mm/slab_common.c                                   |   28 +-
 mm/slob.c                                          |   62 +-
 mm/slub.c                                          |   88 +-
 mm/sparse.c                                        |    2 +-
 mm/truncate.c                                      |   12 +
 mm/vmpressure.c                                    |   20 +-
 mm/vmscan.c                                        |   86 +-
 mm/vmstat.c                                        |   25 +-
 mm/z3fold.c                                        |   10 +-
 net/8021q/vlan.c                                   |    1 -
 net/8021q/vlan_dev.c                               |   33 -
 net/atm/common.c                                   |    2 +-
 net/batman-adv/bat_iv_ogm.c                        |   61 +-
 net/batman-adv/bat_v_ogm.c                         |   41 +-
 net/batman-adv/hard-interface.c                    |    2 +
 net/batman-adv/soft-interface.c                    |   32 -
 net/batman-adv/types.h                             |    7 +
 net/bluetooth/6lowpan.c                            |    8 -
 net/bluetooth/af_bluetooth.c                       |    4 +-
 net/bridge/br_device.c                             |    8 -
 net/bridge/netfilter/ebt_dnat.c                    |   19 +-
 net/bridge/netfilter/nf_conntrack_bridge.c         |    5 +-
 net/caif/caif_socket.c                             |    2 +-
 net/can/af_can.c                                   |    3 +-
 net/can/j1939/main.c                               |    9 +
 net/can/j1939/socket.c                             |  103 +-
 net/can/j1939/transport.c                          |   56 +-
 net/core/datagram.c                                |   10 +-
 net/core/dev.c                                     |  623 +++++++---
 net/core/dev_addr_lists.c                          |   12 +-
 net/core/devlink.c                                 |   45 +-
 net/core/ethtool.c                                 |    4 +-
 net/core/filter.c                                  |    8 +-
 net/core/flow_dissector.c                          |   38 +-
 net/core/lwt_bpf.c                                 |    7 +-
 net/core/net_namespace.c                           |   23 +-
 net/core/request_sock.c                            |    2 +-
 net/core/rtnetlink.c                               |   17 +-
 net/core/skbuff.c                                  |   23 +-
 net/core/skmsg.c                                   |   20 +-
 net/core/sock.c                                    |   38 +-
 net/dccp/ipv4.c                                    |    4 +-
 net/decnet/af_decnet.c                             |    2 +-
 net/dsa/dsa2.c                                     |    2 +-
 net/dsa/master.c                                   |    5 -
 net/dsa/slave.c                                    |   12 -
 net/dsa/tag_8021q.c                                |    2 +-
 net/ieee802154/6lowpan/core.c                      |    8 -
 net/ipv4/datagram.c                                |    2 +-
 net/ipv4/fib_frontend.c                            |    2 +-
 net/ipv4/fib_semantics.c                           |    2 +-
 net/ipv4/inet_connection_sock.c                    |    6 +-
 net/ipv4/inet_diag.c                               |    2 +-
 net/ipv4/inet_hashtables.c                         |    2 +-
 net/ipv4/ip_gre.c                                  |    4 +-
 net/ipv4/ip_output.c                               |   14 +-
 net/ipv4/ipmr.c                                    |    3 +-
 net/ipv4/route.c                                   |   11 +-
 net/ipv4/tcp.c                                     |   79 +-
 net/ipv4/tcp_diag.c                                |    5 +-
 net/ipv4/tcp_fastopen.c                            |    2 +-
 net/ipv4/tcp_input.c                               |   37 +-
 net/ipv4/tcp_ipv4.c                                |   36 +-
 net/ipv4/tcp_minisocks.c                           |   17 +-
 net/ipv4/tcp_output.c                              |   32 +-
 net/ipv4/tcp_timer.c                               |   11 +-
 net/ipv4/udp.c                                     |   29 +-
 net/ipv6/addrconf_core.c                           |    1 +
 net/ipv6/inet6_hashtables.c                        |    2 +-
 net/ipv6/ip6_gre.c                                 |    5 +-
 net/ipv6/ip6_output.c                              |    3 +
 net/ipv6/netfilter.c                               |    3 +
 net/ipv6/route.c                                   |   13 +-
 net/ipv6/seg6_local.c                              |   11 +
 net/ipv6/tcp_ipv6.c                                |   18 +-
 net/ipv6/udp.c                                     |    2 +-
 net/l2tp/l2tp_eth.c                                |    1 -
 net/llc/af_llc.c                                   |   34 +-
 net/llc/llc_c_ac.c                                 |    8 +-
 net/llc/llc_conn.c                                 |   69 +-
 net/llc/llc_if.c                                   |   12 +-
 net/llc/llc_s_ac.c                                 |   12 +-
 net/llc/llc_sap.c                                  |   23 +-
 net/mac80211/main.c                                |    2 +-
 net/mac80211/mlme.c                                |    5 +-
 net/mac80211/rx.c                                  |   11 +-
 net/mac80211/scan.c                                |   30 +-
 net/mac80211/sta_info.c                            |    3 +-
 net/netfilter/ipset/ip_set_core.c                  |   49 +-
 net/netfilter/ipset/ip_set_hash_ipmac.c            |    2 +-
 net/netfilter/ipset/ip_set_hash_net.c              |    1 +
 net/netfilter/ipset/ip_set_hash_netnet.c           |    1 +
 net/netfilter/ipvs/ip_vs_app.c                     |   12 +-
 net/netfilter/ipvs/ip_vs_ctl.c                     |   29 +-
 net/netfilter/ipvs/ip_vs_pe.c                      |    3 +-
 net/netfilter/ipvs/ip_vs_sched.c                   |    3 +-
 net/netfilter/ipvs/ip_vs_sync.c                    |   13 +-
 net/netfilter/nf_conntrack_core.c                  |    4 +-
 net/netfilter/nf_flow_table_core.c                 |    3 +-
 net/netfilter/nf_tables_api.c                      |    7 +-
 net/netfilter/nf_tables_offload.c                  |    5 +-
 net/netfilter/nft_bitwise.c                        |    5 +-
 net/netfilter/nft_cmp.c                            |    2 +-
 net/netfilter/nft_payload.c                        |   38 +
 net/netrom/af_netrom.c                             |   23 -
 net/nfc/llcp_sock.c                                |    4 +-
 net/nfc/netlink.c                                  |    2 -
 net/openvswitch/actions.c                          |    5 +-
 net/openvswitch/datapath.c                         |   20 +-
 net/openvswitch/vport-internal_dev.c               |   11 +-
 net/phonet/socket.c                                |    4 +-
 net/rds/ib_cm.c                                    |   23 +-
 net/rose/af_rose.c                                 |   23 -
 net/rxrpc/ar-internal.h                            |    2 +
 net/rxrpc/call_accept.c                            |    5 +-
 net/rxrpc/call_object.c                            |   34 +-
 net/rxrpc/conn_client.c                            |    9 +-
 net/rxrpc/conn_object.c                            |   13 +-
 net/rxrpc/conn_service.c                           |    2 +-
 net/rxrpc/peer_event.c                             |   11 +-
 net/rxrpc/peer_object.c                            |   16 +-
 net/rxrpc/recvmsg.c                                |   24 +-
 net/rxrpc/sendmsg.c                                |    3 +-
 net/sched/act_api.c                                |   23 +-
 net/sched/act_mirred.c                             |    6 +-
 net/sched/act_mpls.c                               |   12 +-
 net/sched/cls_api.c                                |  119 +-
 net/sched/cls_bpf.c                                |    8 +-
 net/sched/em_meta.c                                |    4 +-
 net/sched/sch_api.c                                |    3 +-
 net/sched/sch_etf.c                                |    2 +-
 net/sched/sch_generic.c                            |   19 +-
 net/sched/sch_hhf.c                                |    8 +-
 net/sched/sch_netem.c                              |   11 +-
 net/sched/sch_sfb.c                                |   13 +-
 net/sched/sch_sfq.c                                |   14 +-
 net/sched/sch_taprio.c                             |   11 +-
 net/sctp/diag.c                                    |    2 +-
 net/sctp/input.c                                   |   16 +-
 net/sctp/sm_make_chunk.c                           |   12 +-
 net/sctp/socket.c                                  |   12 +-
 net/smc/af_smc.c                                   |   16 +-
 net/smc/smc_core.c                                 |    7 +-
 net/smc/smc_pnet.c                                 |    4 +-
 net/smc/smc_rx.c                                   |   29 +-
 net/sunrpc/backchannel_rqst.c                      |    7 +-
 net/sunrpc/xprt.c                                  |    5 +
 net/sunrpc/xprtrdma/backchannel.c                  |    2 +
 net/sunrpc/xprtsock.c                              |   17 +-
 net/tipc/core.c                                    |    2 -
 net/tipc/core.h                                    |    6 +
 net/tipc/socket.c                                  |   12 +-
 net/tls/tls_device.c                               |   10 +-
 net/tls/tls_main.c                                 |    2 +
 net/tls/tls_sw.c                                   |   30 +-
 net/unix/af_unix.c                                 |    6 +-
 net/vmw_vsock/af_vsock.c                           |    2 +-
 net/vmw_vsock/virtio_transport_common.c            |   25 +-
 net/wireless/chan.c                                |    5 +
 net/wireless/nl80211.c                             |    4 +-
 net/wireless/reg.c                                 |    1 +
 net/wireless/reg.h                                 |    8 -
 net/wireless/scan.c                                |   23 +-
 net/wireless/util.c                                |    3 +-
 net/wireless/wext-sme.c                            |    8 +-
 net/x25/x25_dev.c                                  |    2 +-
 net/xdp/xdp_umem.c                                 |    6 +
 net/xdp/xsk.c                                      |   42 +-
 net/xfrm/xfrm_input.c                              |    3 +
 net/xfrm/xfrm_state.c                              |    2 +
 samples/bpf/Makefile                               |    1 +
 samples/bpf/asm_goto_workaround.h                  |   13 +-
 samples/bpf/task_fd_query_user.c                   |    1 +
 .../api/devm_platform_ioremap_resource.cocci       |   60 -
 scripts/coccinelle/misc/add_namespace.cocci        |    2 +
 scripts/gdb/linux/dmesg.py                         |   16 +-
 scripts/gdb/linux/symbols.py                       |   11 +-
 scripts/gdb/linux/utils.py                         |   25 +-
 scripts/mod/modpost.c                              |   60 +-
 scripts/mod/modpost.h                              |    1 +
 scripts/nsdeps                                     |   10 +-
 scripts/recordmcount.h                             |    5 +-
 scripts/setlocalversion                            |    2 +-
 scripts/tools-support-relr.sh                      |    8 +-
 security/lockdown/lockdown.c                       |    1 +
 security/selinux/ss/services.c                     |    9 +-
 sound/arm/pxa2xx-pcm-lib.c                         |   80 +-
 sound/core/pcm_dmaengine.c                         |   83 ++
 sound/pci/hda/patch_hdmi.c                         |   19 +-
 sound/soc/amd/acp-pcm-dma.c                        |   63 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |   56 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |   48 +-
 sound/soc/au1x/dbdma2.c                            |   64 +-
 sound/soc/au1x/dma.c                               |   63 +-
 sound/soc/bcm/cygnus-pcm.c                         |   56 +-
 sound/soc/codecs/Kconfig                           |   44 +-
 sound/soc/codecs/Makefile                          |   10 +
 sound/soc/codecs/adau1761.c                        |  129 ++
 sound/soc/codecs/adau7118-hw.c                     |   43 +
 sound/soc/codecs/adau7118-i2c.c                    |   82 ++
 sound/soc/codecs/adau7118.c                        |  586 +++++++++
 sound/soc/codecs/adau7118.h                        |   24 +
 sound/soc/codecs/cros_ec_codec.c                   | 1128 +++++++++++++----
 sound/soc/codecs/cx2072x.c                         |    2 +-
 sound/soc/codecs/hdac_hda.c                        |  114 +-
 sound/soc/codecs/hdac_hda.h                        |   13 +-
 sound/soc/codecs/madera.h                          |    2 +
 sound/soc/codecs/msm8916-wcd-analog.c              |   54 +-
 sound/soc/codecs/mt6358.c                          |  105 ++
 sound/soc/codecs/pcm3168a.c                        |  143 ++-
 sound/soc/codecs/rt1011.c                          |  249 +++-
 sound/soc/codecs/rt1011.h                          |   24 +
 sound/soc/codecs/rt5514-spi.c                      |   41 +-
 sound/soc/codecs/rt5645.c                          |   19 +-
 sound/soc/codecs/rt5663.c                          |    4 +-
 sound/soc/codecs/rt5677-spi.c                      |  399 +++++++
 sound/soc/codecs/rt5677-spi.h                      |    1 +
 sound/soc/codecs/rt5677.c                          |  445 +++++--
 sound/soc/codecs/rt5677.h                          |   11 +-
 sound/soc/codecs/rt5682.c                          |   43 +-
 sound/soc/codecs/tas2562.c                         |  590 +++++++++
 sound/soc/codecs/tas2562.h                         |   85 ++
 sound/soc/codecs/tas2770.c                         |  819 +++++++++++++
 sound/soc/codecs/tas2770.h                         |  143 +++
 sound/soc/codecs/tlv320aic31xx.c                   |   45 +
 sound/soc/codecs/tlv320aic31xx.h                   |    8 +
 sound/soc/codecs/tlv320aic32x4.c                   |    3 +
 sound/soc/codecs/wcd9335.c                         |   10 +-
 sound/soc/codecs/wm2200.c                          |    5 +
 sound/soc/codecs/wm5100.c                          |    2 +
 sound/soc/codecs/wm8904.c                          |   73 +-
 sound/soc/codecs/wm8904.h                          |    1 +
 sound/soc/codecs/wm8958-dsp2.c                     |   22 +-
 sound/soc/codecs/wm8994.c                          |  156 ++-
 sound/soc/codecs/wm8994.h                          |   10 +-
 sound/soc/codecs/wm_adsp.c                         |   81 +-
 sound/soc/codecs/wm_adsp.h                         |    4 +
 sound/soc/dwc/dwc-pcm.c                            |   48 +-
 sound/soc/fsl/Kconfig                              |   10 +
 sound/soc/fsl/Makefile                             |    2 +
 sound/soc/fsl/fsl_asrc.c                           |  110 +-
 sound/soc/fsl/fsl_asrc.h                           |    7 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |  120 +-
 sound/soc/fsl/fsl_audmix.c                         |    6 +
 sound/soc/fsl/fsl_audmix.h                         |    1 +
 sound/soc/fsl/fsl_dma.c                            |   54 +-
 sound/soc/fsl/fsl_esai.c                           |   12 +
 sound/soc/fsl/fsl_mqs.c                            |  335 ++++++
 sound/soc/fsl/imx-pcm-fiq.c                        |   56 +-
 sound/soc/fsl/mpc5200_dma.c                        |   51 +-
 sound/soc/generic/audio-graph-card.c               |    4 +-
 sound/soc/generic/simple-card.c                    |    4 +-
 sound/soc/intel/Kconfig                            |   17 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |   30 +-
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        |   52 +-
 sound/soc/intel/boards/Kconfig                     |   52 +-
 sound/soc/intel/boards/Makefile                    |   14 +-
 sound/soc/intel/boards/bdw-rt5677.c                |   51 +
 sound/soc/intel/boards/bxt_da7219_max98357a.c      |   11 +
 sound/soc/intel/boards/bxt_rt298.c                 |   11 +
 sound/soc/intel/boards/bytcr_rt5640.c              |   10 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c            |   26 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c         |  487 ++++++++
 sound/soc/intel/boards/glk_rt5682_max98357a.c      |   11 +
 sound/soc/intel/boards/hda_dsp_common.c            |   85 ++
 sound/soc/intel/boards/hda_dsp_common.h            |   32 +
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |  149 ++-
 sound/soc/intel/boards/skl_hda_dsp_common.c        |    6 +
 sound/soc/intel/boards/skl_hda_dsp_common.h        |   27 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    3 +-
 sound/soc/intel/boards/sof_rt5682.c                |   13 +-
 sound/soc/intel/common/Makefile                    |    4 +-
 sound/soc/intel/common/soc-acpi-intel-cfl-match.c  |   18 +
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   56 +
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c  |   31 -
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c  |   18 +
 sound/soc/intel/haswell/sst-haswell-pcm.c          |   62 +-
 sound/soc/intel/skylake/skl-pcm.c                  |   67 +-
 sound/soc/jz4740/jz4740-i2s.c                      |    6 +-
 sound/soc/kirkwood/kirkwood-dma.c                  |   52 +-
 sound/soc/mediatek/Kconfig                         |    1 +
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |   28 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.h  |   10 +-
 sound/soc/mediatek/common/mtk-btcvsd.c             |   76 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |   11 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   26 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |   70 +-
 sound/soc/meson/axg-fifo.c                         |   56 +-
 sound/soc/meson/axg-fifo.h                         |   20 +-
 sound/soc/meson/axg-frddr.c                        |   24 +-
 sound/soc/meson/axg-toddr.c                        |   24 +-
 sound/soc/pxa/mmp-pcm.c                            |   62 +-
 sound/soc/pxa/poodle.c                             |    2 +-
 sound/soc/pxa/pxa-ssp.c                            |   14 +-
 sound/soc/pxa/pxa2xx-ac97.c                        |   14 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |   14 +-
 sound/soc/pxa/pxa2xx-pcm.c                         |   14 +-
 sound/soc/qcom/lpass-platform.c                    |   70 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  106 +-
 sound/soc/qcom/qdsp6/q6asm.c                       |   55 +
 sound/soc/qcom/qdsp6/q6asm.h                       |   15 +
 sound/soc/qcom/qdsp6/q6routing.c                   |   14 +-
 sound/soc/rockchip/Kconfig                         |    3 +-
 sound/soc/rockchip/rockchip_max98090.c             |  313 ++++-
 sound/soc/samsung/Kconfig                          |   12 +-
 sound/soc/samsung/Makefile                         |    4 +-
 sound/soc/samsung/arndale.c                        |  217 ++++
 sound/soc/samsung/arndale_rt5631.c                 |  164 ---
 sound/soc/samsung/idma.c                           |   58 +-
 sound/soc/sh/dma-sh7760.c                          |   46 +-
 sound/soc/sh/fsi.c                                 |   31 +-
 sound/soc/sh/rcar/core.c                           |   54 +-
 sound/soc/sh/rcar/dma.c                            |   30 +-
 sound/soc/sh/siu_pcm.c                             |   44 +-
 sound/soc/soc-component.c                          |  125 +-
 sound/soc/soc-compress.c                           |   52 +-
 sound/soc/soc-core.c                               | 1175 +++++++++-------=
--
 sound/soc/soc-generic-dmaengine-pcm.c              |  165 +--
 sound/soc/soc-jack.c                               |    3 +-
 sound/soc/soc-ops.c                                |   11 +-
 sound/soc/soc-pcm.c                                |  235 ++--
 sound/soc/soc-topology.c                           |   17 +-
 sound/soc/soc-utils.c                              |   11 +-
 sound/soc/sof/Kconfig                              |   43 +-
 sound/soc/sof/control.c                            |   34 +
 sound/soc/sof/core.c                               |   44 +-
 sound/soc/sof/debug.c                              |   16 +
 sound/soc/sof/imx/Kconfig                          |    8 +-
 sound/soc/sof/imx/imx8.c                           |    7 +
 sound/soc/sof/intel/Kconfig                        |   50 +-
 sound/soc/sof/intel/apl.c                          |    8 +
 sound/soc/sof/intel/bdw.c                          |   31 +-
 sound/soc/sof/intel/byt.c                          |   44 +-
 sound/soc/sof/intel/cnl.c                          |   67 +-
 sound/soc/sof/intel/hda-codec.c                    |   22 +-
 sound/soc/sof/intel/hda-dsp.c                      |  137 ++-
 sound/soc/sof/intel/hda-ipc.c                      |    6 +-
 sound/soc/sof/intel/hda-ipc.h                      |   51 +
 sound/soc/sof/intel/hda-loader.c                   |   25 +-
 sound/soc/sof/intel/hda-pcm.c                      |   15 +-
 sound/soc/sof/intel/hda-stream.c                   |   24 +-
 sound/soc/sof/intel/hda.c                          |   25 +-
 sound/soc/sof/intel/hda.h                          |   23 +-
 sound/soc/sof/ipc.c                                |   10 +-
 sound/soc/sof/ops.h                                |   10 +
 sound/soc/sof/pcm.c                                |  135 ++-
 sound/soc/sof/pm.c                                 |  130 +-
 sound/soc/sof/sof-acpi-dev.c                       |   12 +-
 sound/soc/sof/sof-pci-dev.c                        |   88 +-
 sound/soc/sof/sof-priv.h                           |   54 +-
 sound/soc/sof/topology.c                           |  498 +++++---
 sound/soc/sof/trace.c                              |   17 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |   74 +-
 sound/soc/stm/stm32_adfsdm.c                       |   42 +-
 sound/soc/stm/stm32_sai.c                          |    2 +-
 sound/soc/stm/stm32_spdifrx.c                      |   18 +-
 sound/soc/sunxi/sun4i-codec.c                      |    6 +-
 sound/soc/tegra/tegra30_i2s.c                      |   56 +-
 sound/soc/ti/davinci-mcasp.c                       |    2 +-
 sound/soc/txx9/txx9aclc.c                          |   48 +-
 sound/soc/uniphier/aio-dma.c                       |   51 +-
 sound/soc/ux500/ux500_msp_i2s.c                    |    3 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |   63 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   30 +-
 tools/arch/arm/include/uapi/asm/kvm.h              |    4 +-
 tools/arch/arm64/include/uapi/asm/kvm.h            |    4 +-
 tools/arch/s390/include/uapi/asm/kvm.h             |    6 +
 tools/arch/x86/include/uapi/asm/svm.h              |    1 +
 tools/arch/x86/include/uapi/asm/vmx.h              |    8 +-
 tools/bpf/Makefile                                 |    6 +-
 tools/gpio/Makefile                                |    6 +-
 tools/include/uapi/asm-generic/mman-common.h       |    3 +
 tools/include/uapi/drm/i915_drm.h                  |    1 +
 tools/include/uapi/linux/fs.h                      |   55 +-
 tools/include/uapi/linux/fscrypt.h                 |  181 +++
 tools/include/uapi/linux/kvm.h                     |    5 +
 tools/include/uapi/linux/sched.h                   |   30 +-
 tools/include/uapi/linux/usbdevice_fs.h            |    4 +
 tools/lib/bpf/Makefile                             |   33 +-
 tools/lib/bpf/libbpf_internal.h                    |   16 +
 tools/lib/bpf/xsk.c                                |    4 +-
 tools/lib/subcmd/Makefile                          |    8 +-
 tools/perf/Documentation/asciidoc.conf             |    3 +
 tools/perf/Documentation/jitdump-specification.txt |    4 +-
 tools/perf/arch/arm/annotate/instructions.c        |    4 +-
 tools/perf/arch/arm64/annotate/instructions.c      |    4 +-
 tools/perf/arch/powerpc/util/header.c              |    3 +-
 tools/perf/arch/s390/annotate/instructions.c       |    6 +-
 tools/perf/arch/s390/util/header.c                 |    9 +-
 tools/perf/arch/x86/annotate/instructions.c        |    6 +-
 tools/perf/arch/x86/util/header.c                  |    3 +-
 tools/perf/builtin-c2c.c                           |   14 +-
 tools/perf/builtin-kmem.c                          |    1 +
 tools/perf/builtin-kvm.c                           |    7 +-
 tools/perf/builtin-script.c                        |    6 +-
 tools/perf/check-headers.sh                        |    1 +
 tools/perf/jvmti/Build                             |    6 +-
 tools/perf/perf-sys.h                              |    6 +-
 .../arch/s390/{cf_m8561 =3D> cf_z15}/basic.json      |    0
 .../arch/s390/{cf_m8561 =3D> cf_z15}/crypto.json     |    0
 .../arch/s390/{cf_m8561 =3D> cf_z15}/crypto6.json    |    0
 .../arch/s390/{cf_m8561 =3D> cf_z15}/extended.json   |    0
 .../pmu-events/arch/s390/cf_z15/transaction.json   |    7 +
 tools/perf/pmu-events/arch/s390/mapfile.csv        |    2 +-
 tools/perf/pmu-events/jevents.c                    |   12 +-
 tools/perf/tests/perf-hooks.c                      |    3 +-
 tools/perf/util/annotate.c                         |   35 +-
 tools/perf/util/annotate.h                         |    4 +
 tools/perf/util/copyfile.c                         |    8 +-
 tools/perf/util/evlist.c                           |    2 +-
 tools/perf/util/evsel.c                            |    3 +-
 tools/perf/util/header.c                           |    4 +-
 tools/perf/util/hist.c                             |    2 +-
 tools/perf/util/jitdump.c                          |    6 +-
 tools/perf/util/llvm-utils.c                       |    6 +-
 tools/perf/util/map.c                              |    3 +
 tools/perf/util/python.c                           |    6 +
 .../perf/util/scripting-engines/trace-event-perl.c |    8 +-
 .../util/scripting-engines/trace-event-python.c    |    9 +-
 tools/perf/util/trace-event-parse.c                |   31 -
 tools/perf/util/trace-event.h                      |    2 -
 tools/perf/util/util.c                             |    6 +-
 tools/testing/selftests/Makefile                   |   19 +-
 .../selftests/bpf/prog_tests/sockopt_inherit.c     |    2 +-
 tools/testing/selftests/bpf/prog_tests/tcp_rtt.c   |    3 +-
 tools/testing/selftests/bpf/test_flow_dissector.sh |    3 +
 tools/testing/selftests/bpf/test_lwt_ip_encap.sh   |    6 +-
 tools/testing/selftests/bpf/test_offload.py        |    5 +
 tools/testing/selftests/bpf/test_sysctl.c          |    8 +-
 tools/testing/selftests/bpf/test_tc_edt.sh         |    2 +-
 tools/testing/selftests/drivers/net/mlxsw/vxlan.sh |    8 +-
 tools/testing/selftests/kselftest/runner.sh        |   36 +-
 tools/testing/selftests/kselftest_install.sh       |    4 +-
 tools/testing/selftests/kvm/.gitignore             |    2 +
 tools/testing/selftests/kvm/include/x86_64/vmx.h   |    2 +
 tools/testing/selftests/kvm/lib/assert.c           |    4 +-
 tools/testing/selftests/kvm/lib/x86_64/vmx.c       |   10 +
 .../testing/selftests/kvm/x86_64/sync_regs_test.c  |   21 +-
 .../kvm/x86_64/vmx_close_while_nested_test.c       |    6 +-
 .../selftests/kvm/x86_64/vmx_dirty_log_test.c      |    2 +
 .../kvm/x86_64/vmx_set_nested_state_test.c         |   13 +-
 .../selftests/kvm/x86_64/vmx_tsc_adjust_test.c     |    6 +-
 tools/testing/selftests/net/fib_tests.sh           |   21 +
 tools/testing/selftests/net/l2tp.sh                |    0
 tools/testing/selftests/net/reuseport_dualstack.c  |    3 +-
 tools/testing/selftests/net/tls.c                  |  108 ++
 tools/testing/selftests/powerpc/mm/tlbie_test.c    |    2 +-
 tools/testing/selftests/ptp/testptp.c              |   53 +-
 tools/testing/selftests/rtc/settings               |    1 +
 tools/testing/selftests/vm/gup_benchmark.c         |    4 +-
 tools/testing/selftests/watchdog/watchdog-test.c   |   27 +-
 tools/usb/usbip/libsrc/usbip_device_driver.c       |    6 +-
 .../gettimeofday.S =3D> tools/virtio/crypto/hash.h   |    0
 tools/virtio/linux/dma-mapping.h                   |    2 +
 tools/virtio/xen/xen.h                             |    6 +
 virt/kvm/arm/pmu.c                                 |   48 +-
 virt/kvm/kvm_main.c                                |  238 +++-
 1828 files changed, 29811 insertions(+), 15008 deletions(-)
 create mode 100644 Documentation/admin-guide/hw-vuln/multihit.rst
 create mode 100644 Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
 rename Documentation/{kbuild/namespaces.rst =3D> core-api/symbol-namespace=
s.rst} (100%)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau7118.ya=
ml
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i=
-a10-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i=
-a23-codec-analog.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.txt
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,fsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.=
txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sun4i-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec-ana=
log.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2770.txt
 delete mode 100644 Documentation/usb/rio.rst
 create mode 100644 Documentation/x86/tsx_async_abort.rst
 delete mode 100644 arch/arm64/include/asm/vdso_datapage.h
 create mode 100644 arch/riscv/kernel/head.h
 create mode 100644 arch/x86/kernel/cpu/tsx.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/pci.c
 delete mode 100644 drivers/staging/fbtft/fbtft_device.c
 delete mode 100644 drivers/staging/fbtft/flexfb.c
 create mode 100644 drivers/staging/speakup/sysfs-driver-speakup
 delete mode 100644 drivers/usb/misc/rio500.c
 delete mode 100644 drivers/usb/misc/rio500_usb.h
 create mode 100644 include/sound/sof/dai-imx.h
 delete mode 100644 scripts/coccinelle/api/devm_platform_ioremap_resource.c=
occi
 create mode 100644 sound/soc/codecs/adau7118-hw.c
 create mode 100644 sound/soc/codecs/adau7118-i2c.c
 create mode 100644 sound/soc/codecs/adau7118.c
 create mode 100644 sound/soc/codecs/adau7118.h
 create mode 100644 sound/soc/codecs/tas2562.c
 create mode 100644 sound/soc/codecs/tas2562.h
 create mode 100644 sound/soc/codecs/tas2770.c
 create mode 100644 sound/soc/codecs/tas2770.h
 create mode 100644 sound/soc/fsl/fsl_mqs.c
 create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c
 create mode 100644 sound/soc/intel/boards/hda_dsp_common.c
 create mode 100644 sound/soc/intel/boards/hda_dsp_common.h
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-cfl-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-cml-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-jsl-match.c
 create mode 100644 sound/soc/samsung/arndale.c
 delete mode 100644 sound/soc/samsung/arndale_rt5631.c
 create mode 100644 sound/soc/sof/intel/hda-ipc.h
 create mode 100644 tools/include/uapi/linux/fscrypt.h
 rename tools/perf/pmu-events/arch/s390/{cf_m8561 =3D> cf_z15}/basic.json (=
100%)
 rename tools/perf/pmu-events/arch/s390/{cf_m8561 =3D> cf_z15}/crypto.json =
(100%)
 rename tools/perf/pmu-events/arch/s390/{cf_m8561 =3D> cf_z15}/crypto6.json=
 (100%)
 rename tools/perf/pmu-events/arch/s390/{cf_m8561 =3D> cf_z15}/extended.jso=
n (100%)
 create mode 100644 tools/perf/pmu-events/arch/s390/cf_z15/transaction.json
 mode change 100644 =3D> 100755 tools/testing/selftests/net/l2tp.sh
 create mode 100644 tools/testing/selftests/rtc/settings
 rename arch/arm64/kernel/vdso/gettimeofday.S =3D> tools/virtio/crypto/hash=
=2Eh (100%)
 create mode 100644 tools/virtio/xen/xen.h

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3bz84ACgkQJNaLcl1U
h9CxWwf/UtoVuuoyudZxjysC6r30oV0MKibSwViDF2lMC8onWsBX1j/h+rnODNwV
y+WQN8U2xenHpfxI/hCeGM7JOB0JZuDqMESiyJjo5Oin6JT12nQYA2l2BHatP5qD
TUvLPi6U236hFvEpEkoVzk+1cagWFzvtJgdANKl0u7QMvVMQS4fCCqsBwiDERYrN
8RmMoMMDZtptCM/47zGSV5HMjevN5Cwu2sbNLksID0SBA1wGlMkVu+TQHqnoGwSS
bKG7nCCJqitaSDnMoQKXvunOo7SJa76U+YM5oDbW7vg5eVW+wrV+rwSnE1BqdMqD
c0XLB+zByw0BSc15cQFfVBoy9wfRQw==
=1ZCb
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

--===============0411439845749506502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0411439845749506502==--
