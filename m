Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622198A035
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 13:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F08836;
	Mon, 30 Sep 2024 13:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F08836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727695327;
	bh=rgAYbIHR+nhPtrrRBq3CzRqixIFEvPXFZ9pgtqmmkAg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A0wDTwqll/sZKptnpzkXRExKNcF9Wycgm04onWtw6H/vQPFYnm+IjL8ZpfTd85tV5
	 4YM5CCq+tz1MGtdAPSoOzXXqikLx3eNROsQSbOv377TumBr7HRoBP75QUcS9PRaanD
	 cL1V2/8iBdvbbd5hAFK6+1NohT6y3YU7Nw0ltuOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13975F80579; Mon, 30 Sep 2024 13:21:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C589F805AE;
	Mon, 30 Sep 2024 13:21:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7E74F80518; Mon, 30 Sep 2024 13:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E995F80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 13:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E995F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256
 header.s=dc header.b=N5Crvn6K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9JFHu5GN4m1ZIa7hFOr/S0cR7gAkAibwxtDh3yT9bKQ=;
  b=N5Crvn6Kq6KpHSPNN73aCiDy+RvsqlM0pHtSseTwUaXi/R+AUcNhRU/s
   cjlHPMFgIZOJllRTItDSSyRCzG1SoWucsK69kp3cC+hyWG6w77VR7U5lk
   50vSZgwZFWWTGfQ7neSTgSg1frKowyQAjCduh7p7sY9rw2OBXSFMSw4B2
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400";
   d="scan'208";a="185956867"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:25 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	audit@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	dccp@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	drbd-dev@lists.linbit.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-leds@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	tipc-discussion@lists.sourceforge.net,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: [PATCH 00/35] Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:20:46 +0200
Message-Id: <20240930112121.95324-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LI3N2WETGCHIY47FD6PKXZCBALW4MCEZ
X-Message-ID-Hash: LI3N2WETGCHIY47FD6PKXZCBALW4MCEZ
X-MailFrom: Julia.Lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LI3N2WETGCHIY47FD6PKXZCBALW4MCEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

The misordered cases were identified using the following
Coccinelle semantic patch:

// <smpl>
@initialize:ocaml@
@@

let parse_doc l =
  let pieces = List.map String.trim (String.split_on_char '*' l) in
  let l = String.concat " " pieces in
  match String.split_on_char ':' l with
    x::xs -> x
  | _ -> ""

let params ps =
  List.rev
    (List.fold_left
       (fun prev (pm,_) ->
	 let ty =
	   String.trim(Pretty_print_c.string_of_fullType pm.Ast_c.p_type) in
	 if ty = "void" && pm.Ast_c.p_namei = None
	 then prev
	 else
	   let name =
	     match pm.Ast_c.p_namei with
	       Some name -> name
	     | None -> failwith "function parameter has no name" in
	   (String.trim (Pretty_print_c.string_of_name name),ty)::prev)
       [] ps)

@r@
comments c;
identifier fn;
position p;
parameter list ps;
type T;
@@

T@c fn@p(ps) { ... }

@script:ocaml@
p << r.p;
c << r.c;
(_,ps) << r.ps;
@@

let isdoc c ps =
  List.length ps > 1 &&
  (let c = String.trim c in
  String.length c > 3 && String.sub c 0 3 = "/**" && String.get c 3 != '*') in

let subset l1 l2 =
  List.for_all (fun x -> List.mem x l2) l1 in

let (cb,cm,ca) = List.hd c in
match List.rev cb with
  c::_ when isdoc c ps ->
    let pieces = String.split_on_char '@' c in
    (match pieces with
      _::tl ->
	let d_names = List.map parse_doc tl in
	(* check parameters *)
	let p_names = List.map fst (params ps) in
	if d_names <> [] && not(d_names = p_names)
	then
	  begin
	    if List.sort compare d_names = List.sort compare p_names
	    then Coccilib.print_main "out of order" p
	    else if subset d_names p_names
	    then Coccilib.print_main "doc is missing a parameter" p
	    else if subset d_names p_names
	    then Coccilib.print_main "doc has an extra parameter" p
	  end
    | _ -> ())
| _ -> ()
// </smpl>

---

 arch/arm/mach-omap2/prm2xxx_3xxx.c              |    1 -
 arch/powerpc/platforms/ps3/interrupt.c          |    2 +-
 arch/powerpc/platforms/ps3/repository.c         |    2 +-
 drivers/base/firmware_loader/main.c             |    2 +-
 drivers/comedi/drivers/comedi_8254.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c          |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c        |    2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c    |    3 +--
 drivers/gpu/drm/drm_gpuvm.c                     |    2 +-
 drivers/gpu/drm/radeon/radeon_ib.c              |    2 +-
 drivers/iommu/iommu.c                           |    2 +-
 drivers/leds/leds-gpio-register.c               |    2 +-
 drivers/mfd/atmel-smc.c                         |    4 ++--
 drivers/misc/mei/bus.c                          |    2 +-
 drivers/mtd/ubi/eba.c                           |    2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c  |    2 +-
 drivers/net/ethernet/intel/e1000/e1000_hw.c     |    2 +-
 drivers/net/ethernet/intel/i40e/i40e_common.c   |    7 +++----
 drivers/net/ethernet/intel/ice/ice_common.c     |    2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_common.c |    2 +-
 drivers/nvdimm/dimm_devs.c                      |    2 +-
 drivers/pci/hotplug/pci_hotplug_core.c          |    2 +-
 drivers/pinctrl/pinmux.c                        |    2 +-
 drivers/slimbus/messaging.c                     |    2 +-
 drivers/soc/qcom/qmi_interface.c                |    2 +-
 drivers/soundwire/stream.c                      |    2 +-
 drivers/usb/gadget/config.c                     |    4 ++--
 fs/char_dev.c                                   |    2 +-
 fs/dcache.c                                     |    4 ++--
 fs/seq_file.c                                   |    2 +-
 kernel/audit.c                                  |    2 +-
 kernel/resource.c                               |    2 +-
 kernel/sysctl.c                                 |    1 -
 kernel/trace/ring_buffer.c                      |    2 +-
 lib/lru_cache.c                                 |    2 +-
 lib/maple_tree.c                                |    2 +-
 mm/mmu_notifier.c                               |    2 +-
 net/dccp/feat.c                                 |    2 +-
 net/mac80211/mesh_hwmp.c                        |    6 +++---
 net/mac80211/mesh_pathtbl.c                     |   10 +++++-----
 net/socket.c                                    |    2 +-
 net/sunrpc/xprt.c                               |    2 +-
 net/tipc/link.c                                 |   14 +++++++-------
 net/tipc/msg.c                                  |    2 +-
 sound/pci/hda/hda_codec.c                       |    2 +-
 45 files changed, 60 insertions(+), 64 deletions(-)
